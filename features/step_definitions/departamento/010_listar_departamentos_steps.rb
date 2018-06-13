# This is the steps file referred to 010_listar_departamentos feature
# Place your code relative to that feature here
Dado("que existam departamentos com campos {string}, {string}, {string}") do |name, initial, code|
    @department = Department.create(name: name, initial: initial, code: code)
end

Então("Devo ver uma lista dos departamentos com os campos {string}, {string}, {string}") do |name, initial, code|
  expect(page).to have_content(name)
  expect(page).to have_content(initial)
  expect(page).to have_content(code)
end
