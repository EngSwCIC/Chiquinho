Quando("eu clicar no botão de Comentários") do
  comment_params = {content: "Conteudo comentario"}
  @comment = Comment.new(comment_params)
  @comment.user_id = @user.id
  @comment.topic_id = @topic.id
  @comment.save!

  path = course_forum_topic_path(@course.id, @course.forum.id, @topic.id)
  link = "a[href=\'#{path}\']"
  find(link,match: :first).click
  expect(current_path).to eq(course_forum_topic_path(@course.id, @course.forum, @topic.id))
end

Quando("eu clicar no botão de Respostas") do
  click_link "Respostas"
  expect(current_path).to eq(course_forum_topic_comment_path(@course.id, @course.forum, @topic.id, @comment.id))
end

Quando("eu digitar a resposta:") do |table|
  @response_comment = Response.new
  table.rows_hash.each do |field,value|
    @response_comment[field] = value
  end
  @response_comment[:comment_id] = @comment.id
  @response_comment.save
end

Quando("eu pressionar o botão enviar resposta") do
  click_button("Enviar Resposta")
end

Então("devo permanecer na pagina de respostas") do
  expect(current_path).to eq(course_forum_topic_comment_path(@course.id, @course.forum, @topic.id, @comment.id))
end

Então("enxergar a minha resposta com os dados:") do |table|
  table.rows_hash do |chave,valor|
    expect(page).to eq(valor)
  end
end