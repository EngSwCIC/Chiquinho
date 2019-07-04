Quando("eu clicar no botao de filtro") do
  click_button("filter")
end

Quando("eu prencher com o código da matéria:") do |table|
  table.rows_hash.each do |field,value|
  	fill_in field, with: value
  end
  
end

Quando("eu apertar o botão pesquisar") do
  #click_button("Pesquisar")
  #click_button caso não funcionar click_link				
end

Então("devo ser redirecionado para a pagina materias") do
  #expect(current_path).to eq("/search_subject")
end

Então("verificar que as materias estao filtradas pelo código") do
  #expect(page).to have_content "133230"
  
end