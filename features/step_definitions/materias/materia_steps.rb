# This is the steps file referred to materia feature
# Place your code relative to that feature here

#index steps
Dado("que eu tenha uma lista de matérias {string}, {string}, {string}, {string}") do |code, name, credits, area|
  @subject = Subject.create(code: code, name: name, credits: credits, area: area)
end

Então("eu devo ver a lista completa com as matérias {string}, {string}, {string}, {string}") do |code, name, credits, area|
  expect(page).to have_content code
  expect(page).to have_content name
  expect(page).to have_content credits
  expect(page).to have_content area
end

#show steps
Dado("que eu tenha uma matéria criada com os atributos:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  @subject = Subject.new
  table.rows_hash.each do |field,value|
    @subject[field] = value
  end
  @subject.save
end

Dado("que eu esteja na página de matérias") do
  visit subjects_path
end

Quando("eu clicar no link para detalhes daquela matéria") do
  path = subject_path(@subject.id)
  link = "a[href=\'#{path}\']"
  find(link).click
end

Então("eu devo ver a página de matéria com {string}, {string} e os dados dela:") do |ranking_str, professores_str, table|
  # table is a Cucumber::MultilineArgument::DataTable
  expect(page).to have_content ranking_str
  expect(page).to have_content professores_str
  table.rows_hash.each do |field,value|
    expect(page).to have_content value
  end
end

