require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
    describe 'POST create' do
        let(:user) { FactoryBot.create(:user)}
        let(:subject) { FactoryBot.create(:subject)}
        context 'subject comments' do
            context 'when params are valid' do
                before do
                    sign_in user
                    request.env['HTTP_REFERER'] = subject_path(subject)
                    post :create, params: {comment: comment_params}
                end

                let(:comment_params) do
                    {content: 'testando controller', user_id: user.id, subject_id: subject.id}
                end
                
                it 'returns http status 302 adn redirect to subject page' do
                    expect(response).to have_http_status(302)
                    expect(response).to redirect_to(subject_path(subject))
                end
                
                it 'comment exists in database' do
                    @comment = Comment.find_by(content: comment_params[:content],user_id: user.id, subject_id: subject.id)
                    expect(@comment).not_to be_nil
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
end
