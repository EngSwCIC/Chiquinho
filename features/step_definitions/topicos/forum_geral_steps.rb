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
  table.rows_hash do |chave,valor|
    expect(page).to eq(valor) 
  end
end





