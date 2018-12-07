Dado("que existam professores com campos {string} e {string}") do |name, office|
  @professor = Professor.create(name: name, office: office)
end

Então("devo ver que a sala do professor é {string}") do |room|
  expect(page).to have_content("Sala: " + room)
end

Dado("que existam professores com campos {string} sem o campo sala") do |name|
  @professor = Professor.create(name: name)
end

Então("devo ver que a sala do professor não está disponível") do
  expect(page).to have_content("Sala: Não disponível")
end
