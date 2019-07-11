require 'rails_helper'

RSpec.describe  TopicsController, type: :controller do
  describe 'DELETE destroy' do 
    let(:user){FactoryBot.create(:user)}
    context 'postagem deletada' do
      before do
        @course = Course.create(:kind=>"Presencial", :code=>"19", :name=>"ADMINISTRAÇÃO", :turn=>"Diurno")
        @user2 = User.create!(email: "lmarianocarvalho3@hotmail.com", first_name: "Lucas Mariano", last_name: "Carvalho", matricula: "16/0133661", password: "102030", course: @course)                
        @forum = Forum.create!(course_id: @course.id)
        @topic = Topic.create!(title: 'Titulo Teste', description: 'Desc Teste', user_id: user.id, forum_id: @forum.id)
        sign_in user
      end
      context 'usuario deleta propria postagem' do 
        before do
          request.env['HTTP_REFERER'] = course_forum_topic_path(@course, @forum, @topic)
          delete :destroy, params: {course_id: @course.id, forum_id: @forum.id, id: @topic.id}
        end
        it 'returns http status 302 and redirect to topic page' do
          expect(response).to have_http_status(302)
          expect(response).to redirect_to(course_forum_path(@course.id,@forum.id))
        end
      end
      context 'usuario tenta deletar postagem de outro' do
        before do
          request.env['HTTP_REFERER'] = course_forum_topic_path(@course, @forum, @topic)                    
          delete :destroy, params: {course_id: @course.id, forum_id: @forum.id, id: @topic.id}                
        end
        it 'returns http status 422 and redirect to topic page' do
          expect(response).to have_http_status(302)
          expect(response).to redirect_to(course_forum_path(@course.id,@forum.id))                
        end
      end
    end
  end
end