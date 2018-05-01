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

#create steps

#show steps

#edit steps

#destroy steps
