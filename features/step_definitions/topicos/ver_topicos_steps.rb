Dado("que existam os topicos criados com os campos {string}, {string}") do |title, description|
  @course = Topic.create(title: title, description: description)
end

Entao("eu devo ver a lista completa com os topicos {string}") do |title|
  expect(page).to have_content(title)
end