# This is the steps file referred to ver_professor feature
# Place your code relative to that feature here

Dado("que esteja na pagina de listagem de professores") do
  visit professors_path
end

Quando("eu clicar no link de detalhes do professor {string}") do |name|
  #@professor = Professor.find_by(name: name)
  path = professor_path(@professor)
  link = "a[href=\'#{path}\']"
  find(link).click
end

Então("devo ir pra uma pagina com detalhes sobre o professor {string}") do |name|
  expect(page).to have_content(name)
end
