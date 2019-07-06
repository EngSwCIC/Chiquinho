Dado("que estou na página do fórum do curso de {string}") do |string|
  @user = User.find_by(email: "nicknish@hotmail.com")
  course_params = {kind: "Presencial", code: 370, name: "CIÊNCIA DA COMPUTAÇÃO", turn: "Diurno", classification: "exatas", opcode: nil}
  Course.create(course_params)
  @course = Course.find_by(name: string)

  topic_params = {title: string, description: "oi"}
  @topic = Topic.new(topic_params)
  @topic.user = @user
  @topic.forum = @course.forum
  @topic.save!
  visit course_forum_path(@course.id, @course.forum)
  expect(page).to have_content("Título")
end

Quando("eu clicar no botão Comentários") do
  path = course_forum_topic_path(@course.id, @course.forum.id, @topic.id)
  link = "a[href=\'#{path}\']"
  find(link,match: :first).click
  expect(current_path).to eq(course_forum_topic_path(@course.id, @course.forum, @topic.id))
end

Quando("eu digitar o comentário:") do |table|
  @comment_course = Comment.new
  table.rows_hash.each do |field,value|
    @comment_course[field] = value
  end
  @comment_course[:topic_id] = @topic.id
  @comment_course.save
end

Quando("eu pressionar o botão enviar comentário") do
  click_button("Enviar Comentario")
end

Então("devo ir para a página do tópico") do
  expect(current_path).to eq(course_forum_topic_path(@course.id, @course.forum, @topic.id))
end

Então("enxergar o meu comentário com os dados:") do |table|
  table.rows_hash do |chave,valor|
    expect(page).to eq(valor)
  end
end

# SAD PATH: USUÁRIO NÃO ESTÁ LOGADO
Dado("que estou na página do fórum do curso {string}") do |string|
  course_params = {kind: "Presencial", code: 370, name: "CIÊNCIA DA COMPUTAÇÃO", turn: "Diurno", classification: "exatas", opcode: nil}
  Course.create(course_params)
  @course = Course.find_by(name: string)
  user_params = {email: "admin@admin.com", password:"123456", first_name:"admin", last_name:"aidmin", matricula:"12/3456789"}
  @user = User.new(user_params)
  @user.course = @course
  @user.save!
  topic_params = {title: string, description: "oi"}
  @topic = Topic.new(topic_params)
  @topic.user = @user
  @topic.forum = @course.forum
  @topic.save!
  visit course_forum_path(@course.id, @course.forum)
  expect(page).to have_content("Título")
end

Então("devo ir para a página de login") do
  expect(current_path).to eq(user_session_path)
end