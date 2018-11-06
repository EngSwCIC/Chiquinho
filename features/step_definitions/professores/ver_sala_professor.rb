Dado("que existam professores com campos {string} e {string}") do |name, office|
  @professor = Professor.create(name: name, office: office)
end

Então("devo ir pra uma pagina com detalhes sobre o professor {string} com a sala {string}") do |name, room|
  expect(page).to have_content(name)
  expect(page).to have_content(room)
end
