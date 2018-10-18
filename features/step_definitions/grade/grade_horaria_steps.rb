# This is the steps file referred to grade_horaria feature
# Place your code relative to that feature here

Dado("que eu esteja na pagina de grade horária") do
  visit user_schedule_path
end

Quando("eu clicar na coluna para adicionar um matéria") do
  pending
  # find('#00').click
  # expect(page).to have_content "Adicione uma Matéria"
end

Então("eu devo ver a nova matéria adicionada a grade {string}") do |materia_name|
  expect(page).to have_content materia_name
end

Então("devo ver a quantidade de {int} créditos e {string}") do |creditos_total, creditos_materia|
  expect(page).to have_content creditos_total
  expect(page).to have_content creditos_materia
end

##Ver Gráficos
Dado("que eu tenha adicionado uma matéria a minha grade") do
  # pending
  steps %Q{
    Dado que eu tenha me cadastrado e me autenticado
    E que eu tenha uma matéria criada com os atributos:
      |code   |116327                 |
      |name   |ORGANIZAÇÃO DE ARQUIVOS|
      |credits|002 002 000 004        |
      |area   |AC                     |
    E que eu esteja na pagina de grade horária
    Quando eu clicar na coluna para adicionar um matéria
    E preencher o formulário com:
      |materia-search|ORGANIZAÇÃO DE ARQUIVOS|
    E clicar no botão "Adicionar"
  }
end

Dado("que eu esteja na pagina dessa matéria") do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando("eu clicar no botão Adicionar Turma {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Então("devo ver os horários preenchidos na minha grade:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  pending # Write code here that turns the phrase above into concrete actions
end

Então("eu devo ver gráficos de dificuldade") do
  pending # Write code here that turns the phrase above into concrete actions
end

Dado("que eu tenha a matéria na minha grade:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  pending # Write code here that turns the phrase above into concrete actions
end

Dado("com a turma {string} de horário:") do |string, table|
  # table is a Cucumber::MultilineArgument::DataTable
  pending # Write code here that turns the phrase above into concrete actions
end

Quando("eu clicar em algum dos blocos de horário:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  pending # Write code here that turns the phrase above into concrete actions
end

Então("todos os blocos dessa turma na grade devem ser removidos") do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando("eu clicar em {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Então("todos os blocos de horário da minha grade devem estar vazios") do
  pending # Write code here that turns the phrase above into concrete actions
end

