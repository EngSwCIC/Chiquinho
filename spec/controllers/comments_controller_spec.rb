require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
    let(:valid_attributes) {
        skip("Add a hash of attributes valid for your model")
    }
    
    let(:valid_session) { {} }
    
    describe 'DELETE destroy' do 
        let(:user){FactoryBot.create(:user)}
        context 'comentario deletado' do
            before do
                @course = Course.create(:kind=>"Presencial", :code=>"19", :name=>"ADMINISTRAÇÃO", :turn=>"Diurno")
                @user2 = User.create!(email: "admin@admin.com", first_name: "admin", last_name: "aidmin", matricula: "12/3456789", password: "123456", course: @course)                
                @forum = Forum.create!(course_id: @course.id)
                @topic = Topic.create(title: 'Titulo Teste', description: 'Desc Teste', user_id: user.id, forum_id: @forum.id)
                @comment = Comment.create(content: 'Conteudo', user_id: user.id)
                @comment2 = Comment.create!(content: 'Conteudo', user_id: @user2.id)
                sign_in user   
            end
            context 'usuario deleta proprio comentario' do 
                before do
                    request.env['HTTP_REFERER'] = course_forum_topic_comment_path(@course, @forum, @topic, @comment)
                    delete :destroy, params: {course_id: @course.id, forum_id: @forum.id, topic_id: @topic.id, id: @comment.id}
                end
                it 'returns http status 302 and redirect to topic page' do
                    expect(response).to have_http_status(302)
                    expect(response).to redirect_to(course_forum_topic_path(@course.id,@forum.id,@topic.id))
                end
            end
            context 'usuario tenta deletar comentario de outro' do
                before do
                    request.env['HTTP_REFERER'] = course_forum_topic_comment_path(@course, @forum, @topic, @comment2)                    
                    delete :destroy, params: {course_id: @course.id, forum_id: @forum.id, topic_id: @topic.id, id: @comment2.id}                
                end
                it 'returns http status 422 and redirect to topic page' do
                    expect(response).to have_http_status(302)
                    expect(response).to redirect_to(course_forum_topic_path(@course.id,@forum.id,@topic.id))                
                end
            end
        end
    end

    describe 'PUT update' do 
        let(:user){FactoryBot.create(:user)}
        context "editar comentario" do 
            before do
                @course = Course.create(:kind=>"Presencial", :code=>"19", :name=>"ADMINISTRAÇÃO", :turn=>"Diurno")
                @user2 = User.create!(email: "admin@admin.com", first_name: "admin", last_name: "aidmin", matricula: "12/3456789", password: "123456", course: @course)                
                @forum = Forum.create!(course_id: @course.id)
                @topic = Topic.create!(title: 'Titulo Teste', description: 'Desc Teste', user_id: user.id, forum_id: @forum.id)
                @comment = Comment.create(content: 'Conteudo', user_id: user.id)
                @comment2 = Comment.create!(content: 'Conteudo', user_id: @user2.id)
                sign_in user   
            end
            context "usuario edita proprio comentario" do
                before do
                    request.env['HTTP_REFERER'] = course_forum_topic_comment_path(@course, @forum, @topic, @comment)
                    put :update, params:{course_id: @course.id, forum_id: @forum.id, topic_id: @topic.id, id: @comment.id, comment:{content: "novo conteudo"}}
                end
                it "edita o comentário" do 
                    @comment.reload
                    expect(@comment.content).to eq("novo conteudo")
                end
            end
            context "usuario edita comentário de outro" do
                before do
                    request.env['HTTP_REFERER'] = course_forum_topic_comment_path(@course, @forum, @topic, @comment2)
                    put :update, params:{course_id: @course.id, forum_id: @forum.id, topic_id: @topic.id, id: @comment2.id, comment2:{content: "novo conteudo"}}                    
                end
                it "não edita o comentário" do
                    @comment.reload
                    expect(@comment.content).to eq("Conteudo")
                end 
            end
        end
    end

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
                
                it 'returns http status 302 and redirect to subject page' do
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
                    sign_in user
                    request.env['HTTP_REFERER'] = subject_path(subject)
                    post :create, params: {comment: comment_params}
                end
                
                let(:comment_params) do
                    { comment:{content: '', user: user} }
                end
                
                it 'return http status 302 and redirect to subject page' do
                    expect(response).to have_http_status(302)
                    expect(response).to redirect_to(subject_path(subject))
                end

                it 'error message' do
                    expect(request.flash[:error]).not_to be_nil
                end
            end
        end
    end
end
