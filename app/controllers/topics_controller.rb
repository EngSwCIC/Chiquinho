class TopicsController < ApplicationController
    include TopicsHelper
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_action :set_topic, only: [:show, :edit, :update, :destroy]
    before_action :require_topic_owner, only: [:edit, :update, :destroy]

    ##
    # Método para a recuperação de dados para a página de criação de novo post ou resposta.
    # Determina se o tópico é um post ou uma resposta.
    def new
        @topic = Topic.new

        assign_topic_tags_or_parent

        @parent = session[:last_topic_id]
        if !@parent.blank?
            @parent = Topic.find(@parent)
        end
    end

    ##
    # Ao clicar em enviar na pagina de criação de tópico este método é chamado para tratar os dados enviados pelo usuário e salvar o tópico no banco de dados
    # Em seguida ocorre um redirecionamento se o tópico foi salvo com sucesso.
    # Redireciona para a página do tópico principal se é uma resposta ou para a página geral do fórum se for um novo tópico.
    def create
        @topic = Topic.new(topic_params)

        assign_topic_tags_or_parent

        if @topic.save
            redirect_topic
        else
            flash[:error] = 'Não foi possível salvar seu tópico ou resposta.'
            render :new
        end

    end

    ##
    # Método para a página de edição do post.
    # Busca na database o post a ser editado.
    def edit
    end

    ##
    # Método para tratamento dos dados editados do post e redicionamento em caso de sucesso na edição
    def update
        if @topic.update(topic_params)
            redirect_topic
        else
            flash[:error] = 'Não foi possível remover seu tópico ou resposta.'
            render :new
        end
    end

    ##
    # Método para exibição de um post específico.
    # Procura na database o post E suas respostas para exibição.
    def show
        # Redefine último post visualizado na sessão como sendo o post atual (para utilização do id no CRUD)
        reassign_last_topic()

        #@topic = Topic.find(params[:id])
        @responses = Topic.where(topic_id: @topic.id, deleted: false).order(:created_at)
    end

    ##
    # Método para exibição do fórum, exibe os posts que tem as tags vindas de params (curso, professor e/ou matéria).
    # Armazena as tags na sessão para propagação segura em GET (CRUD).
    def index
        clear_session_filters()

        params_filters_to_session()

        @topics = Topic.where( build_query_from_filters )

    end

    ##
    # Método para remoção de post ou resposta
    # Ao invés de remover o registro da database, altera o campo deleted para true, dessa forma posts podem ser recuperados eventualmente.
    def destroy
        if @topic.update(deleted: true)
            redirect_back fallback_location: topics_url
        else
            flash[:error] = 'Não foi possível remover seu tópico ou resposta.'
            render :new
        end
    end


    private

    ##
    # Limpa os filtros da sessão
    def clear_session_filters
        session.delete(:last_topic_id)
        session.delete(:filter_course_id)
        session.delete(:filter_professor_id)
        session.delete(:filter_subject_id)
    end

    ##
    # Armazena na sessão o(s) filtro(s) obtido(s) de params (professor, curso ou matéria)
    # session[:filter_professor_id] = params[:professor_id]
    def params_filters_to_session
        store_filter_in_session_from_params('course')
        store_filter_in_session_from_params('subject')
        store_filter_in_session_from_params('professor')
    end
    def store_filter_in_session_from_params(filter)
        params_filter = "#{filter}_id".to_sym
        session_filter = "filter_#{filter}_id".to_sym
        parameter = params[params_filter]
        if !parameter.blank?
            session[session_filter] = parameter
        end
    end

    ##
    # Re-armazena na sessão o último tópico visto
    def reassign_last_topic
        session.delete(:last_topic_id)
        session[:last_topic_id] = params[:id]
    end

    ##
    # Atribui os filtros existentes em session ao objeto Topic atual
    # Se for uma resposta atribui apenas o id do topico pai
    # Busca antes na database os objetos de cada filtro (professor, materia e/ou curso) para checar se o mesmo existe
    def assign_topic_tags_or_parent
        parent_id = session[:last_topic_id]
        if !parent_id.blank?
            @topic.topic_id = parent_id
        else
            assign_topic_course
            assign_topic_subject
            assign_topic_professor
        end
    end
    def assign_topic_course
        filter = session[:filter_course_id]
        if !filter.blank?
            @topic.course_id = Course.find(filter).id
        end
    end
    def assign_topic_subject
        filter = session[:filter_subject_id]
        if !filter.blank?
            @topic.subject_id = Subject.find(filter).id
        end
    end
    def assign_topic_professor
        filter = session[:filter_professor_id]
        if !filter.blank?
            @topic.professor_id = Professor.find(filter).id
        end
    end


    ##
    # Recebe os parâmetros do formulário de criação e edição de tópico
    def topic_params
        params[:topic][:user_id] = current_user.id
        params.require(:topic).permit(:title, :description, :user_id)
    end

    def set_topic
        @topic = Topic.find(params[:id])
    end

    ##
    # Redireciona para o tópico pai ou para si mesmo se não for resposta
    def redirect_topic
        if @topic.topic_id
            redirect_to topic_path( @topic.topic_id )
        else
            redirect_to topic_path( @topic.id )#build_redirect_hash_from_session()
        end
    end

    ##
    # Checa se o usuário realizando a ação sobre um tópico/resposta é o mesmo usuário que o criou
    def require_topic_owner
        if current_user.id != @topic.user.id
            flash[:danger] = "Ação permitida apenas ao criador do tópico ou resposta."
            redirect_to topics_path
        end
    end

end