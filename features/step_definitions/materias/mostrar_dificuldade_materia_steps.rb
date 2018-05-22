# This is the steps file referred to mostrar_dificuldade_materia feature
# Place your code relative to that feature here
#
Dado("que ela tenha sido avaliada com provas {int}, trabalhos {int} e tarefas {int}") do |provas, trabalhos, tarefas|
  @user = User.create(first_name: "Nicholas",last_name: "Marques",email: "nicholasmarques@cjr.org.br",password: "123456")
  @rating = ProfessorSubjectUser.create(user_id: @user.id, professor_subject_id: @professor_subject.id, provas: provas,tarefas: tarefas, trabalhos: trabalhos)
end

Quando("eu acessar a página daquela matéria") do
  visit subject_path(@subject)
end

Então("eu devo ver gráficos com o valores provas {int}, trabalhos {int} e tarefas {int}") do |provas, trabalhos, tarefas|
  #expect(page).to have_content provas
  #expect(page).to have_content trabalhos
  #expect(page).to have_content tarefas
end
