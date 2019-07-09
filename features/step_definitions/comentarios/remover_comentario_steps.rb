Dado("que eu tenha criado o comentário") do
  comment_params = {content: "conteudo"}
  @comment = Comment.new(comment_params)
  @comment.user_id = @user.id
  @comment.topic_id = @topic.id
  @comment.save!
  
end

Quando("eu clicar no botão de remover comentário") do
  #expect(page).to have_content("Comentários")  
  #path = course_forum_topic_comment_path(@course, @course.forum, @topic, @comment)
  #link = "a[href=\'#{path}\'][data-method=\'delete\']"
  #first(link).click
  click_link "Deletar"
end

Então("o comentário deve ser removido") do
  expect(page).to have_content("O comentário foi removido com sucesso.")
end

Então("devo ir para a página do tópico atual") do
  expect(current_path).to eq(course_forum_topic_path(@course.id, @course.forum, @topic.id))
end