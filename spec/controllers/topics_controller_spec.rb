#language: pt
#encoding: utf-8

require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
    describe 'POST create' do
        let(:course) { FactoryBot.create(:course)}
        let(:subject) { FactoryBot.create(:subject)}
        let(:professor) { FactoryBot.create(:professor)}
        let(:user) { FactoryBot.create(:user)}
        let(:topic) { FactoryBot.create(:topic)}
        context 'valid params course' do
            before do
                sign_in user
                request.env['HTTP_REFERER'] = course_path(course)
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
               sign_in user
               request.env['HTTP_REFERER'] = subject_path(subject)
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
                sign_in user
                request.env['HTTP_REFERER'] = professor_path(professor)
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
                    #@comment = Comment.find_by(content: comment_params[:content],user_id: user.id, subject_id: subject.id)
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
            context 'get has no params' do
                before do
                    get :index, params: {}
                    get :new, params: {}
                end
                it 'returns http status 200' do
                    expect(response).to have_http_status(200)
                end
            end
        end
    end

end