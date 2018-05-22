# This is the steps file referred to avaliar_uma_materia_professor feature
# Place your code relative to that feature here
#
Dado("que eu tenha me cadastrado e me autenticado") do
  steps %Q{
    Dado que eu esteja na página inicial
      Quando eu clicar no link "Entrar"
      E eu clicar no link "Novo usuário? Cadastre-se"
      E preencher o formulário com:
      |user_email|nicknish@hotmail.com     |
      |user_matricula |150019343           |
      |user_first_name      |Nicholas      |
      |user_last_name       |Marques       |
      |user_password  |123456              |
      |user_password_confirmation|123456   |
      E selecionar o meu curso "CIÊNCIA DA COMPUTAÇÃO"
      E clicar no botão "Cadastrar-se"
  }
end

Dado("que exita uma matéria criada com um professor") do
  @professor = Professor.create(name: "Genaína")
  @subject = Subject.create(code: "113034",name: "CÁLCULO 1",credits: "002 004 000 006",area: "AC")
  @professor_subject = ProfessorSubject.create!(professor_id: @professor.id, subject_id: @subject.id)
end

Quando("eu clicar no link para detalhes daquela matéria com aquele professor") do
  visit subject_professor_path(@subject,@professor)
end

Quando("clicar na estrela de avalição para {int} estrelas") do |int|
  pending # Write code here that turns the phrase above into concrete actions
end

Então("eu devo ver uma mensagem dizendo {string}") do |msg|
  expect(page).to have_content msg
end

Então("devo ver as {int} estrelas aparecendo para aquela avaliação") do |stars|
  expect(page).to have_content stars
end
