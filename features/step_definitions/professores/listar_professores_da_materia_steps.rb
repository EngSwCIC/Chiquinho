# This is the steps file referred to listar_professores_da_materia feature
# Place your code relative to that feature here
Dado("que exitam professores que ministrem essa materia com campos {string}") do |name|
  @professor = Professor.create(name: name)
  @subject.professors << @professor
end
Entao("devo ver cards com todos os professores que ministram aquela materia {string}") do |name|
  page.should have_xpath('.//div[@class="card"]', count: @professors.size)
  expect(page).to have_content(name)
end
