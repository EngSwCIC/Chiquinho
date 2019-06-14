Dado("que eu esteja na página principal") do
  visit root_path
end

Quando("eu clicar no submenu Fórum") do
  path = forums_path
  link = "a[href=\'#{path}\']"
  find(link).click  
end

Então("eu devo ser redirecionado para página do fórum geral") do
  expect(current_path).to eq(forums_path)
end

Então("enxergar os tópicos criados:") do |table|
  #expect(page).to have_content("oi")
  table.rows_hash do |chave,valor|
    expect(page).to eq(valor) 
  end
end

=begin
Então("enxergar os tópicos criados:") do |table|
  data = table.hashes
  forums = []
  data.each do |row|
    row.each do |key, value|
      if key == 'Tópico de Engenharia de Softwarecd '
        forums << value
      end
    end
    puts forums
  end
end
=end




