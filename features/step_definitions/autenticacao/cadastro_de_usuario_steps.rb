# This is the steps file referred to cadastro_de_usuario feature
# Place your code relative to that feature here
#
Dado("que eu esteja na página inicial") do
  visit("/")
end

Quando("eu clicar no link {string}") do |btn_cadastro|
  click_link btn_cadastro
end

Quando("preencher o formulário com:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.rows_hash.each do |field,value|
    fill_in field, with: value
  end
end

Quando("clicar no botão {string}") do |btn_cadastrar|
  click_button btn_cadastrar
end

Então("eu devo ser redirecionado para página inicial") do
  expect(current_path).to eq("/")
end

Então("devo ver os conteúdos {string} e meu primeiro nome {string}") do |success_message,first_name|
  expect(page).to have_content success_message
  expect(page).to have_content first_name
end
