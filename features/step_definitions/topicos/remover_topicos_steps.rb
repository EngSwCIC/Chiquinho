Dado("que eu tenha criado o tópico {string}") do |string|
  @user = User.find_by(email: "nicknish@hotmail.com")
  topic_params = {title: string, description: "oi"}
  @topic = Topic.new(topic_params)
  @topic.user = @user
  @topic.forum = @course.forum
  @topic.save
  #@topic = Topic.find_by(name: string)
  #puts @course.id
  #visit course_path(@course)
end

Quando("eu clicar no botão de Forum") do
  #find("a", text: /\AForum\z/).click
  visit course_forum_path(@course, @course.forum)
end

Quando("eu clicar no botão de remover em um tópico criado por mim") do
  path = course_forum_topic_path(@course,@topic.forum, @topic)
  link = "a[href=\'#{path}\'][data-method=\'delete\']"
  find(link,match: :first).click
end

Então("o tópico deverá ser removido") do
  expect(page).to have_content("O tópico foi removido com sucesso.")
end

Então("eu serei redirecionado para a página do fórum do curso") do
  expect(current_path).to eq(course_forum_path(@course, @course.forum)) 
end
