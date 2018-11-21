# This is the steps file referred to ver_turma feature
# Place your code relative to that feature here


Dado("que eu esteja na página da matéria") do
  visit subject_path(Subject.first)
end

Dado("que existam turmas para essa matéria com o nome {string}") do |name|
  professor = Professor.create(name: "professor")
  @subject_class = SubjectClass.create(name: name, subject_id: Subject.first.id, professor_id: professor.id)
end

Quando("eu clicar no link de detalhes da turma {string}") do |name|
  path = subject_class_path(SubjectClass.find_by_name(name))
  link = "a[href=\"#{path}\"]"
  find(link).click
end

Então("devo ir pra uma pagina com detalhes sobre a turma {string}") do |name|
  expect(page).to have_content(name)
end
