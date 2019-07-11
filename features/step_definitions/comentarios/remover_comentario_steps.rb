Dado("que eu tenha criado o comentário") do
  comment_params = {content: "conteudo"}
  @comment = Comment.new(comment_params)
  @comment.user_id = @user.id
  @comment.topic_id = @topic.id
  @comment.save!
  
end

Dado("exista um comentário criado") do
  comment_params = {content: "oi"}
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

Então("Na pagina do topico o comentário deve ser removido") do
  expect(page).to have_content("O comentário foi removido com sucesso.")
end

Então("não enxergar nenhum botão de deletar") do
  expect(page).not_to have_link('Deletar', href:course_forum_topic_comment_path(@course.id, @course.forum, @topic.id, @comment.id))
end