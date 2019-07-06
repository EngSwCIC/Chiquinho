Dado("que estou na página do fórum do curso de {string}") do |string|
  @user = User.find_by(email: "nicknish@hotmail.com")
  course_params = {kind: "Presencial", code: 370, name: "CIÊNCIA DA COMPUTAÇÃO", turn: "Diurno", classification: "exatas", opcode: nil}
  Course.create(course_params)
  @course = Course.find_by(name: string)

  topic_params = {title: string, description: "oi"}
  @topic = Topic.new(topic_params)
  @topic.user = @user
  @topic.forum = @course.forum
  @topic.save
  visit course_forum_path(@course.id, @course.forum)
  #expect(page).to have_content("Título")
end

Quando("eu clicar no botão Comentários") do
  path = course_forum_topic_path(@course.id, @course.forum, @topic.id)
  link = "a[href=\'#{path}\']"
  find(link,match: :first).click
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
  find("#comment_topic_id").click
end

Então("devo ir para a página do tópico") do
  pending # Write code here that turns the phrase above into concrete actions
end

Então("enxergar o meu comentário com os dados:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  pending # Write code here that turns the phrase above into concrete actions
end