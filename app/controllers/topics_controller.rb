class TopicsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user!, only: [:new, :create]
    def new
        @topic = Topic.new
        @filters = []
        @is_response = false

        if !session.has_key?(:last_topic_id)
            @is_response = false
            if session.has_key?(:filter_course_id)
                course = Course.find_by(id: session[:filter_course_id])
                @filters << course.name.downcase.capitalize
            end
            if session.has_key?(:filter_professor_id)
                professor = Professor.find_by(id: session[:filter_professor_id])
                @filters << professor.name.downcase.capitalize
            end
            if session.has_key?(:filter_subject_id)
                subject = Subject.find_by(id: session[:filter_subject_id])
                @filters << subject.name.downcase.capitalize
            end
            @filtersmsg = @filters.join("&nbsp;·&nbsp;")
        else
            @is_response = true
            rtopic = Topic.find(session[:last_topic_id])
            @filtersmsg = "Em resposta à: "
            @filtersmsg << rtopic.title
        end
    end

    def create
        @topic = Topic.new(topic_params)
        #user = find_session_user()
        @topic.user_id = find_session_user().id

        filters = ['course', 'professor', 'subject']

        if session.has_key?(:last_topic_id)
            #rtopic = Topic.find(session[:last_topic_id])
            @topic.topic_id = Topic.find(session[:last_topic_id]).id
#            if @topic.save
#                redirect_to topic_path( @topic.topic_id )
#            else
#                flash[:error] = 'Não foi possível salvar sua resposta.'
#                render :new
#            end
        else
            assign_topic_categories_from_session(filters)
            #filters.each do |filter|
            #    filter_sym = "filter_#{filter}_id".to_sym
            #    if session.has_key?(filter_sym)
            #        @topic.send("#{filter}_id=", Kernel.const_get(filter.capitalize).find_by(id: session[filter_sym]).id)
            #    end
            #end

#            if @topic.save
#                redirect_to topics_path( build_redirect_hash(filters) )
#            else
#                flash[:error] = 'Não foi possível salvar seu tópico'
#                render :new
#            end
        end
            if @topic.save
                if @topic.topic_id != nil
                    redirect_to topic_path( @topic.topic_id )
                else
                    redirect_to topics_path( build_redirect_hash(filters) )
                end
            #if @topic.save
            else
                flash[:error] = 'Não foi possível salvar seu tópico ou resposta.'
                render :new
            end
    end

    def edit
        @topic = Topic.find(params[:id])
    end

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
            flash[:error] = 'Não foi possível salvar seu tópico'
            render :new
        end
    end

    def show
        reassign_last_topic()

        @user = find_session_user()

        @topic = Topic.find(params[:id])

        @author = User.find(@topic.user_id)

        @responses = Topic.where(topic_id: @topic.id, deleted: false).order(:created_at)

        @usernames = {@author.id => "#{@author.first_name.capitalize} #{@author.last_name.capitalize}"}.merge(get_topics_usernames(@responses))
        #@usernames = Hash.new
        #@usernames.store(@author.id, "#{@author.first_name.capitalize} #{@author.last_name.capitalize}")
        #@usernames = @usernames.merge(get_topics_usernames(@responses))
    end

    def index
        clear_session_filters()

        filters = ["course", "professor", "subject"]
        store_filters_in_session_from_params(filters)

        @query = build_filters_query(filters)
        @topics = Topic.where( @query )

    end

    def destroy
      @topic = Topic.find(params[:id])
      @topic.update(deleted:true)
      redirect_back fallback_location: topics_url
    end


    ############### PRIVATE CLASS METHODS #################
    private

    def find_session_user
        user = nil
        if session.has_key?("warden.user.user.key")
            user = User.find(session["warden.user.user.key"][0][0])
        end
        return user
    end

    def clear_session_filters
        session.delete(:last_topic_id)
        session.delete(:filter_course_id)
        session.delete(:filter_professor_id)
        session.delete(:filter_subject_id)
    end

    def store_filters_in_session_from_params(filters)
        filters.each do |filter|
            tag_sym = "#{filter}_id".to_sym
            filter_sym = "filter_#{filter}_id".to_sym
            if params.has_key?(tag_sym) && params[tag_sym] != ""
                session[filter_sym] = params[tag_sym]
            end
        end
    end

    def reassign_last_topic
        session.delete(:last_topic_id)
        session[:last_topic_id] = params[:id]
    end

    def build_filters_query(filters)
        query = []
        filters.each do |filter|
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

    def topic_params
        params.require(:topic).permit(:title, :description)
    end

    def build_redirect_hash(filters)
        redirect_hash = Hash.new
        filters.each do |filter|
            tag_sym = "#{filter}_id".to_sym
            filter_sym = "filter_#{filter}_id".to_sym
            if (session.has_key?(filter_sym))
                redirect_hash.store(tag_sym, session[filter_sym])
            end
        end
        return redirect_hash
    end

    def assign_topic_categories_from_session(filters)
        filters.each do |filter|
            filter_sym = "filter_#{filter}_id".to_sym
            if session.has_key?(filter_sym)
                @topic.send("#{filter}_id=", Kernel.const_get(filter.capitalize).find_by(id: session[filter_sym]).id)
            end
        end
    end
end
