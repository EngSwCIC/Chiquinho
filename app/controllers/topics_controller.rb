class TopicsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user!, only: [:new, :create]
    def new
        @topic = Topic.new
    end

    def create
        @topic = Topic.new(topic_params)
        
        user = User.find_by(id: session["warden.user.user.key"][0][0]) 
        @topic.user_id = user.id
        
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

    def index
        session.delete(:filter_course_id)
        session.delete(:filter_professor_id)
        session.delete(:filter_subject_id)
        if params.has_key?(:course_id) || params.has_key?(:professor_id) || params.has_key?(:subject_id)
            if params.has_key?(:course_id) 
                session[:filter_course_id] = params[:course_id]
            end
            if params.has_key?(:professor_id) 
                session[:filter_professor_id] = params[:professor_id]
            end
            if params.has_key?(:subject_id) 
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

        @topics = Topic.where(@query.join(' and '))

    end

    private

    def topic_params
        params.require(:topic).permit(:title, :description)
    end
end
