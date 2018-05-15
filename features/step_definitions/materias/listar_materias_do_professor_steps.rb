# This is the steps file referred to listar_materias_do_professor feature
# Place your code relative to that feature here
Dado("que exita um professor criado com os atributos:") do |table|
  @professor = Professor.new
  table.rows_hash.each do |field,value|
    @professor[field] = value
  end
  @professor.save
end

Dado("que ele ministre as materias {string}, {string}, {string}, {string}") do |code, name, credits, area|
  @subject = Subject.create(code: code, name: name, credits: credits, area: area)
  @professor.subjects << @subject
end

Então("eu devo ver a cards das materias ministradas por esse professor {string}, {string}, {string}, {string}") do |code, name, credits, area|
  page.should have_xpath('.//div[@class="card"]', count: @professor.subjects.size)
  expect(page).to have_content(code)
  expect(page).to have_content(name)
  expect(page).to have_content(credits)
  expect(page).to have_content(area)
end
