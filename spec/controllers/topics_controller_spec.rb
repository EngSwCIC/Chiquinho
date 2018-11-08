require 'rails_helper'


RSpec.describe TopicsController, type: :controller do
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
end