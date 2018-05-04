# This is the steps file referred to listar_professores feature
# Place your code relative to that feature here

Dado("que existam professores com campos {string}") do |name|
  @professor = Professor.create(name: name)
end

Entao("eu devo ver a lista completa com os professores {string}") do |name|
  expect(page).to have_content(name)
end
