# This is the steps file referred to grade_horaria feature
# Place your code relative to that feature here
#
Dado("que eu esteja na pagina de grade horária") do
  visit user_schedule_path
end

Quando("eu clicar na coluna para adicionar um matéria") do
  find('#00').click
  #expect(page).to have_content "Adicione uma Matéria"
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
