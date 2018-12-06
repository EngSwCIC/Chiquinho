class TopicsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user!, only: [:new, :create]

    ##
    # Método para a recuperação de dados para a página de criação de novo post ou resposta.
    # Determina os filtros (professor, curso e/ou matéria) e se o tópico é um post ou uma resposta.
    def new
        @topic = Topic.new

        @is_response = false
        if !session.has_key?(:last_topic_id)
            @filtersmsg = get_filters_string
        else
            @is_response = true
            @filtersmsg = "Em resposta à: " + Topic.find(session[:last_topic_id]).title
        end
    end

    ##
    # Ao clicar em enviar na pagina de criação de tópico este método é chamado para tratar os dados enviados pelo usuário e salvar o tópico no banco de dados
    # Em seguida ocorre um redirecionamento se o tópico foi salvo com sucesso.
    # Redireciona para a página do tópico principal se é uma resposta ou para a página geral do fórum se for um novo tópico.
    def create
        @topic = Topic.new(topic_params)
        @topic.user_id = find_session_user().id

        if session.has_key?(:last_topic_id)
            @topic.topic_id = Topic.find(session[:last_topic_id]).id
        else
            assign_topic_categories_from_session()
        end

        if @topic.save
            if @topic.topic_id != nil
                redirect_to topic_path( @topic.topic_id )
            else
                redirect_to topics_path( build_redirect_hash() )
            end
        else
            flash[:error] = 'Não foi possível salvar seu tópico ou resposta.'
            render :new
        end
    end

    ##
    # Método para a página de edição do post.
    # Busca na database o post a ser editado.
    def edit
        @topic = Topic.find(params[:id])
    end

    ##
    # Método para tratamento dos dados editados do post e redicionamento em caso de sucesso na edição
    def update
        @topic = Topic.find(params[:id])
        @topic.title = params[:topic][:title]
        @topic.description = params[:topic][:description]
        if @topic.save
            if @topic[:topic_id]
                redirect_to topic_path(@topic.topic_id)
            else
                redirect_to topic_path(@topic.id)
            end
        else
            flash[:error] = 'Não foi possível salvar seu tópico ou resposta.'
            render :new
        end
    end

    ##
    # Método para exibição de um post específico.
    # Procura na database o post, suas respostas e os nomes dos autores dos mesmos para exibição.
    def show
        # Redefine último post visualizado na sessão como sendo o post atual (para utilização do id no CRUD)
        reassign_last_topic()

        @user = find_session_user()
        @topic = Topic.find(params[:id])
        @author = User.find(@topic.user_id)
        @responses = Topic.where(topic_id: @topic.id, deleted: false).order(:created_at)
        @usernames = {@author.id => "#{@author.first_name.capitalize} #{@author.last_name.capitalize}"}.merge(get_topics_usernames(@responses))

    end

    ##
    # Método para exibição do fórum, exibe os posts que tem as tags vindas de params (curso, professor e/ou matéria).
    # Armazena as tags na sessão para propagação segura em GET (CRUD).
    def index
        clear_session_filters()

        filters = ["course", "professor", "subject"]
        store_filters_in_session_from_params()

        @query = build_filters_query()
        @topics = Topic.where( @query )

    end

    ##
    # Método para remoção de post ou resposta
    # Ao invés de remover o registro da database, altera o campo deleted para true, dessa forma posts podem ser recuperados eventualmente.
    def destroy
      @topic = Topic.find(params[:id])
      @topic.update(deleted:true)
      redirect_back fallback_location: topics_url
    end


    private

    ##
    # Retorna o usuário logado
    def find_session_user
        user = nil
        if session.has_key?("warden.user.user.key")
            user = User.find(session["warden.user.user.key"][0][0])
        end
        return user
    end

    ##
    # Limpa os filtros da sessão
    def clear_session_filters
        session.delete(:last_topic_id)
        session.delete(:filter_course_id)
        session.delete(:filter_professor_id)
        session.delete(:filter_subject_id)
    end

    ##
    # Armazena na sessão os filtros obtidos de params (professor, curso ou matéria)
    def store_filters_in_session_from_params
        ['course', 'professor', 'subject'].each do |filter|
            tag_sym = "#{filter}_id".to_sym
            filter_sym = "filter_#{filter}_id".to_sym
            if params.has_key?(tag_sym) && params[tag_sym] != ""
                session[filter_sym] = params[tag_sym]
            end
        end
    end

    ##
    # Re-armazena na sessão o último tópico visto
    def reassign_last_topic
        session.delete(:last_topic_id)
        session[:last_topic_id] = params[:id]
    end

    ##
    # Constrói a query SQL para busca de posts na database com os filtros existentes na sessão
    def build_filters_query
        query = []
        ['course', 'professor', 'subject'].each do |filter|
            tag_sym = filter.to_sym
            filter_sym = "filter_#{filter}_id".to_sym
            if session.has_key?(filter_sym)
                query << "#{filter}_id = #{session[filter_sym]}"
            end
        end
        query = query.join(' and ')
        query << ((query.length > 0) ? (' and ') : (''))
        query << 'topic_id is null and deleted = false'

        return query
    end

    ##
    # A partir de uma lista de tópicos recupera da database o nome dos autores destes tópicos e retorna uma hash.
    def get_topics_usernames(topics)
        usernames = Hash.new
        topics.each do |topic|
            topic_user = User.find(topic.user_id)
            if (!usernames.has_key?(topic_user.id))
                topic_name = "#{topic_user.first_name.capitalize} #{topic_user.last_name.capitalize}"
                usernames.store(topic_user.id, topic_name)
            end
        end
        return usernames
    end

    ##
    # Constrói uma hash com os filtros da sessão (professor, matéria e curso) para ser utilizada no redirecionamento
    def build_redirect_hash
        redirect_hash = Hash.new
        ['course', 'professor', 'subject'].each do |filter|
            tag_sym = "#{filter}_id".to_sym
            filter_sym = "filter_#{filter}_id".to_sym
            if (session.has_key?(filter_sym))
                redirect_hash.store(tag_sym, session[filter_sym])
            end
        end
        return redirect_hash
    end

    ##
    # Atribui os filtros existentes em session ao objeto Topic atual
    # Busca antes na database os objetos de cada filtro (professor, materia e/ou curso) para checar se o mesmo existe
    def assign_topic_categories_from_session
        ['course', 'professor', 'subject'].each do |filter|
            filter_sym = "filter_#{filter}_id".to_sym
            if session.has_key?(filter_sym)
                @topic.send("#{filter}_id=", Kernel.const_get(filter.capitalize).find_by(id: session[filter_sym]).id)
            end
        end
    end

    ##
    # Função auxiliar que procura na database o nome dos objetos filtrados (professor, curso, matéria) e os concatena em uma string
    def get_filters_string
        str = []
        ['course', 'professor', 'subject'].each do |filter|
            filter_sym = "filter_#{filter}_id".to_sym
            if session.has_key?(filter_sym)
                str.push Kernel.const_get(filter.capitalize).find_by(id: session[filter_sym]).name.downcase.capitalize
            end
        end
        return str.join(" · ")
    end

    ##
    # Recebe os parâmetros do formulário de criação de tópico
    def topic_params
        params.require(:topic).permit(:title, :description)
    end
end
