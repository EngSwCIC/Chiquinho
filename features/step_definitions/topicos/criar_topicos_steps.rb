Dado("que estou na página do curso de {string}") do |string|
  course_params = {kind: "Presencial", code: 370, name: "CIÊNCIA DA COMPUTAÇÃO", turn: "Diurno", classification: "exatas", opcode: nil}
    Course.create(course_params)
    @course = Course.find_by(name: string)
    #puts @course.id
    visit course_path(@course)
end

Quando("eu pressionar o botão Criar novo tópico") do
  find("a", text: /\ACriar novo tópico\z/).click
end

Quando("eu escrever no formulario:") do |table|
  @topic_course = Topic.new
  table.rows_hash.each do |field,value|
    @topic_course[field] = value   
  end
  @topic_course[:forum_id] = @course.forum.id
  @topic_course.save
end

Quando("eu pressionar o botão enviar") do
  click_button("Criar Tópico")
  #expect(page).to have_content("oi")
end

Então("devo ir para a página de tópicos") do
  expect(current_path).to eq(course_forum_path(@course, @course.forum)) 
end

Então("enxergar o meu tópico criado com os dados:") do |table|
  table.rows_hash do |chave,valor|
    expect(page).to eq(valor) 
  end
end
