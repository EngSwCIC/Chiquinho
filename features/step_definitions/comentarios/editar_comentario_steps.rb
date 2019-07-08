Quando("eu clicar no botão de editar comentário") do
  click_link "Editar"
end

Quando("preencher o comentário com os dados:") do |table|
  expect(page).to have_content("Editar Comentário")

  table.rows_hash.each do |field,value|
    @comment[field] = value
  end
  @comment[:topic_id] = @topic.id
  @comment.save
end

Então("devo ir para a página do tópico escolhido") do
  expect(page).to have_content("comment was successfully updated.")
end

Então("o comentario deverá ser editado:") do |table|
  table.rows_hash do |chave,valor|
    expect(page).to eq(valor)
  end
end
