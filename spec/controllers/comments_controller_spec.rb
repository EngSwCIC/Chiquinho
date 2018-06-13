require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
    describe 'POST create' do
        let(:user) { FactoryBot.create(:user)}
        context 'when params are valid' do
            before do
                post :create, params: {comment: comment_params}
            end
            let(:comment_params) do
                { comment:{content: 'testando controller', user: user} }
            end
            it 'returns http status 302' do
                expect(response).to have_http_status(302)
            end
            
            it 'comment exists in database' do
                Comment.create(comment_params[:comment])
                expect(Comment.find_by(content: comment_params[:comment][:content], user: user)).to be_truthy
            end
        end
        
        context 'when params are invalid' do
            before do
                post :create, params: {comment: comment_params}
            end
            
            let(:comment_params) do
                { comment:{content: '', user: user} }
            end
            
            it 'return http status 302' do
                expect(response).to have_http_status(302)
            end
            
        end
    end
end
