require 'rails_helper'

RSpec.describe ResponsesController, type: :controller do
  describe 'POST create' do
    let(:user) { FactoryBot.create(:user)}
    context 'criar resposta para comentario' do
      before do
        @course = Course.create(:kind=>"Presencial", :code=>"19", :name=>"ADMINISTRAÇÃO", :turn=>"Diurno")
        @user2 = User.create!(email: "admin@admin.com", first_name: "admin", last_name: "aidmin", matricula: "12/3456789", password: "123456", course: @course)                
        @forum = Forum.create!(course_id: @course.id)
        @topic = Topic.create(title: 'Titulo Teste', description: 'Desc Teste', user_id: user.id, forum_id: @forum.id)
        @comment = Comment.create(content: 'Conteudo', user_id: user.id)
        @comment2 = Comment.create!(content: 'Conteudo', user_id: @user2.id)
        @response = Response.create!(content: 'Conteudo comentario', user_id: user.id, comment_id: @comment.id)
      end
      context 'usuário logado' do
        before do
          sign_in user
          request.env['HTTP_REFERER'] = course_forum_topic_comment_path(@course.id, @forum.id, @topic.id, @comment.id)
          post :create, params: {response: response_params}
        end
        let(:response_params) do
          {content: 'testando controller', user_id: user.id, comment_id: @comment.id}
        end
        it 'returns http status 302 and redirect to subject page' do
          expect(response).to have_http_status(302)
          expect(response).to redirect_to(course_forum_topic_comment_path(@course.id, @forum.id, @topic.id, @comment.id))
        end
      end
      context 'usuário não ta logado' do
        before do
          request.env['HTTP_REFERER'] = course_forum_topic_comment_path(@course.id, @forum.id, @topic.id, @comment.id)
          post :create, params: {response: response_params}
        end
        let(:response_params) do
          { response:{content: 'testando falha', user: user} }
        end
        it 'redireciona para página de login' do
          expect(response).to have_http_status(302)
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end
  end
end
