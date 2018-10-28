# This is the steps file referred to ver_turma feature
# Place your code relative to that feature here

Dado("que existam turmas para essa matéria com o nome {string}") do |name|
  pending
  # @class = Class.create(name: name)
  # @subject.classes << @class
end

Quando("eu clicar no link de detalhes da turma {string}") do |name|
  pending
  # path = class_path(@class)
  # link = "a[href=\'#{path}\']"
  # find(link).click
end

Então("devo ir pra uma pagina com detalhes sobre a turma {string}") do |name|
  pending
  # expect(page).to have_content(name)
end
