# This is the steps file referred to listar_cursos feature
# Place your code relative to that feature here

Dado("que existam os cursos criados com os campos {string},{int},{string},{string},{int}") do |kind, code, name, turn, classification|
  @course = Course.create(kind: kind, code: code, name: name, turn: turn, classification: classification)
end

Entao("eu devo ver a lista completa com os cursos {string},{int},{string},{string},{int}") do |kind, code, name, turn, classification|
  expect(page).to have_content(kind)
  expect(page).to have_content(code)
  expect(page).to have_content(name)
  expect(page).to have_content(turn)
  expect(page).to have_content(@course.classification[classification])
end
