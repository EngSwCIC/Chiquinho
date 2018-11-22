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

        user = User.find(session["warden.user.user.key"][0][0])
        @topic.user_id = user.id

        if session.has_key?(:last_topic_id)
            rtopic = Topic.find(session[:last_topic_id])
            @topic.topic_id = rtopic.id
            if @topic.save
                redirect_to topic_path( rtopic.id )
            else
                flash[:error] = 'Não foi possível salvar sua resposta.'
                render :new
            end
        else
            if session.has_key?(:filter_course_id)
                course = Course.find_by(id: session[:filter_course_id])
                @topic.course_id = course.id
            end
            if session.has_key?(:filter_professor_id)
                professor = Professor.find_by(id: session[:filter_professor_id])
                @topic.professor_id = professor.id
            end
            if session.has_key?(:filter_subject_id)
                subject = Subject.find_by(id: session[:filter_subject_id])
                @topic.subject_id = subject.id
            end
            if @topic.save
                redirect_to topics_path( { :course_id => session[:filter_course_id],
                    :professor_id => session[:filter_professor_id],
                    :subject_id => session[:filter_subject_id] } )
            else
                flash[:error] = 'Não foi possível salvar seu tópico'
                render :new
            end
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
        session.delete(:last_topic_id)
        session[:last_topic_id] = params[:id]

        if session.has_key?("warden.user.user.key")
            @user = User.find(session["warden.user.user.key"][0][0])
        else
            @user = nil
        end
        @topic = Topic.find(params[:id])
        @author = User.find(@topic.user_id)
        @responses = Topic.where(topic_id: @topic.id, deleted: false).order(:created_at)
        @usernames = Hash.new
        @usernames.store(@author.id, (@author.first_name.capitalize + " " + @author.last_name.capitalize))
        if @responses.count > 0
            @responses.each do |response|
                responseuser = User.find(response.user_id)
                if !(@usernames.has_key? responseuser.id) then
                    responsename = (responseuser.first_name.capitalize + " " + responseuser.last_name.capitalize)
                    @usernames.store(responseuser.id, responsename)
                end
            end
        end
    end

    def index
        session.delete(:last_topic_id)
        session.delete(:filter_course_id)
        session.delete(:filter_professor_id)
        session.delete(:filter_subject_id)
        if params.has_key?(:course_id) || params.has_key?(:professor_id) || params.has_key?(:subject_id)
            if params.has_key?(:course_id) && params[:course_id] != ""
                session[:filter_course_id] = params[:course_id]
            end
            if params.has_key?(:professor_id) && params[:professor_id] != ""
                session[:filter_professor_id] = params[:professor_id]
            end
            if params.has_key?(:subject_id) && params[:subject_id] != ""
                session[:filter_subject_id] = params[:subject_id]
            end
        end


        @query = []
        if session.has_key?(:filter_course_id)
            @query << ('course_id = ' + session[:filter_course_id])
        end
        if session.has_key?(:filter_professor_id)
            @query << ('professor_id = ' + session[:filter_professor_id])
        end
        if session.has_key?(:filter_subject_id)
            @query << ('subject_id = ' + session[:filter_subject_id])
        end

        @query = @query.join(' and ')
        @query << ((@query.length > 0) ? (' and ') : (''))
        @query << 'topic_id is null and deleted = false'

        @topics = Topic.where( @query )

    end

    def destroy
      @topic = Topic.find(params[:id])
      @topic.update(deleted:true)
      redirect_back fallback_location: topics_url
    end

    private
    #def set_topic
    #  @topic = Topic.find(params[:id])
    #end

    def topic_params
        params.require(:topic).permit(:title, :description)
    end
end
