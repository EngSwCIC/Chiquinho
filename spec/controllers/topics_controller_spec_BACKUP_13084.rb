#language: pt
#encoding: utf-8

require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
    describe 'POST create' do
<<<<<<< HEAD
        let(:topic) { FactoryBot.create(:topic)}
        
=======
        let(:course) { FactoryBot.create(:course)}
        let(:subject) { FactoryBot.create(:subject)}
        let(:professor) { FactoryBot.create(:professor)}
        let(:user) { FactoryBot.create(:user)}
        let(:topic) { FactoryBot.create(:topic)}
>>>>>>> 55e2a6ba95ce31ce27a6e7d0ccb51e889edade2e
        context 'valid params course' do
            before do
                sign_in User.find(topic.user_id)
                post :create, params: {topic: topic_params}, session: {:filter_course_id => topic.course_id}
            end
            let(:topic_params) do
                {title: 'título teste', description: 'descrição teste'}
            end

            it 'returns http status 302 and redirect to subject page' do
                expect(response).to have_http_status(302)
                expect(response).to redirect_to(topics_path({:course_id => topic.course_id}))
            end
            
            it 'comment exists in database' do
                @topic = Topic.find_by(title: 'título teste', description: 'descrição teste')
                expect(@topic).not_to be_nil
            end
        end

        context 'valid params subject' do
            before do
                sign_in User.find(topic.user_id)
                post :create, params: {topic: topic_params}, session: {:filter_subject_id => topic.subject_id}
            end
            let(:topic_params) do
                {title: 'título teste', description: 'descrição teste'}
            end
            
            it 'returns http status 302 and redirect to subject page' do
                expect(response).to have_http_status(302)
                expect(response).to redirect_to(topics_path({:subject_id => topic.subject_id}))
            end
            
            it 'comment exists in database' do
                @topic = Topic.find_by(title: 'título teste', description: 'descrição teste')
                expect(@topic).not_to be_nil
            end
        end

        context 'valid params professor' do
            before do
                sign_in User.find(topic.user_id)
                post :create, params: {topic: topic_params}, session: {:filter_professor_id => topic.professor_id}
            end

            let(:topic_params) do
                {title: 'título teste', description: 'descrição teste'}
            end
            
            it 'returns http status 302 and redirect to subject page' do
                expect(response).to have_http_status(302)
                expect(response).to redirect_to(topics_path({:professor_id => topic.professor_id}))
            end
            
            it 'comment exists in database' do
                @topic = Topic.find_by(title: 'título teste', description: 'descrição teste')
                expect(@topic).not_to be_nil
            end
        end

        context 'valid params response' do
            before do
                sign_in User.find(topic.user_id)
                post :create, params: {topic: topic_params}, session: {:last_topic_id => topic.id}
            end

            let(:topic_params) do
                {title: 'título teste', description: 'descrição teste'}
            end
            
            it 'returns http status 302 and redirect to subject page' do
                expect(response).to have_http_status(302)
                expect(response).to redirect_to(topic_path(topic.id))
            end
            
            it 'response exists in database' do
                @topic = Topic.find_by(title: 'título teste', description: 'descrição teste')
                expect(@topic).not_to be_nil
            end
        end
    end


    describe 'GET #index' do
        let(:topic) { FactoryBot.create(:topic)}
        context 'view all posts' do
            context 'get has no params' do
                before do
                    get :index, params: {}
                end
                it 'returns http status 200' do
                    expect(response).to have_http_status(200)
                end
                it 'topics exist' do
                    @topics = Topic.all
                    expect(@topics).not_to be_nil
                end
            end
        end
        context 'view posts related to professors subjects or courses' do
            context 'get has course_id as params' do
                before do
                    get :index, params: {:course_id => topic.course_id}
                end
                it 'returns http status 200' do
                    expect(response).to have_http_status(200)
                end
                it 'topics exist' do
                    @topics = Topic.find_by(course_id: topic.course_id)
                    expect(@topics).not_to be_nil
                end
            end
            context 'get has subject_id as params' do
                before do
                    get :index, params: {:subject_id => topic.subject_id}
                end
                it 'returns http status 200' do
                    expect(response).to have_http_status(200)
                end
                it 'topics exist' do
                    @topics = Topic.find_by(subject_id: topic.subject_id)
                    expect(@topics).not_to be_nil
                end
            end
            context 'get has professor_id as params' do
                before do
                    get :index, params: {:professor_id => topic.professor_id}
                end
                it 'returns http status 200' do
                    expect(response).to have_http_status(200)
                end
                it 'topics exist' do
                    @topics = Topic.find_by(professor_id: topic.professor_id)
                    expect(@topics).not_to be_nil
                end
            end
        end
    end

    describe 'GET #new' do
        let(:topic) { FactoryBot.create(:topic)}
        context 'new post' do
            context 'new general forum post' do
                before do
                    sign_in User.find(topic.user_id)#user
                    #get :index, params: {}
                    get :new, params: {}
                end
                
                it 'returns http status 200' do
                    expect(response).to have_http_status(200)
                end
            end
            context 'new specific forum post' do
                before do
                    sign_in User.find(topic.user_id)
                    get :new, params: {}, session: {:filter_subject_id => topic.subject_id, :filter_course_id => topic.course_id, :filter_professor_id => topic.professor_id}
                end
                
                it 'returns http status 200' do
                    expect(response).to have_http_status(200)
                end
            end
            context 'new post response' do
                before do
                    sign_in User.find(topic.user_id)
                    #get :index, params: {}
                    get :new, params: {}, session: {:last_topic_id => topic.id}
                end
                
                it 'returns http status 200' do
                    expect(response).to have_http_status(200)
                end
            end
        end
    end

    describe 'GET #edit' do
        let(:topic) { FactoryBot.create(:topic)}
        context 'edit post page' do
            before do
                sign_in User.find(topic.user_id)
                get :edit, params: {:id => topic.id}
            end
            
            it 'returns http status 200' do
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'PUT #edit' do
        let(:topic) { FactoryBot.create(:topic)}
        #let(:topic2) { FactoryBot.create(:topic, topic_id: topic.id)}
        #let(:response) { FactoryBot.create(:response)}
        #let(:topic) { }
        context 'edit' do

            context 'post page' do
                before do
                    #topic = Topic.find(topic.id)
                    sign_in User.find(topic.user_id)
                    patch :update, params: {id: topic.id, topic: topic_params}
                end
                let(:topic_params) do
                    {title: 'título editado', description: 'descrição editada'}
                end
                
                it 'returns http status 200' do
                    expect(response).to have_http_status(302)
                    expect(response).to redirect_to(topic_path(topic.id))
                end
                it 'topics exist' do
                    @topics = Topic.find(topic.id)
                    expect(@topics.title).to eq 'título editado'
                end
                it 'topics exist' do
                    @topics = Topic.find(topic.id)
                    expect(@topics.description).to eq 'descrição editada'
                end
            end

        end
    end

    describe 'DELETE #destroy' do
        let(:topic) { FactoryBot.create(:topic)}
        #let(:topic2) { FactoryBot.create(:topic, topic_id: topic.id)}
        #let(:response) { FactoryBot.create(:response)}
        #let(:topic) { }
        context 'edit' do
            context 'post page' do
                before do
                    #topic = Topic.find(topic.id)
                    sign_in User.find(topic.user_id)
                    delete :destroy, params: {id: topic.id}
                end
                
                it 'redirects' do
                    expect(response).to have_http_status(302)
                end
                it 'topic doesent exist' do
                    @topics = Topic.find(topic.id)
                    expect(@topics.deleted).to eq true
                end
            end

        end
    end

    describe 'GET #show' do
        let(:topic) { FactoryBot.create(:topic)}
        #let(:topic2) { FactoryBot.create(:topic, topic_id: topic.id)}
        #let(:response) { FactoryBot.create(:response)}
        #let(:topic) { }
        context 'show' do

            context 'post' do
                before do
                    #topic = Topic.find(topic.id)
                    sign_in User.find(topic.user_id)
                    get :show, params: {id: topic.id}
                end
                let(:topic_params) do
                    {title: 'título editado', description: 'descrição editada'}
                end
                
                it 'returns http status 200' do
                    expect(response).to have_http_status(200)
                end
            end

        end
    end

end

