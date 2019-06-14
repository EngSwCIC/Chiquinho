Quando("eu clicar no botão de editar em um tópico criado por mim") do
  path = edit_course_forum_topic_path(@course,@topic.forum, @topic)
  link = "a[href=\'#{path}\']"
  find(link,match: :first).click
end

Quando("preencher o formulario com os dados:") do |table|
  table.rows_hash.each do |field,value|
    @topic[field] = value   
  end
  @topic[:forum_id] = @course.forum.id
  @topic.save
end

Quando("eu apertar o botao enviar") do
  #pending # Write code here that turns the phrase above into concrete actions
  click_button("Enviar")
end

Entao("o tópico deverá ser editado:") do |table|
  table.rows_hash do |chave,valor|
    expect(page).to eq(valor)
  end
end

