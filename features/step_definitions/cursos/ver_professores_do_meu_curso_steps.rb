# This is the steps file referred to ver_professores_do_meu_curso feature
# Place your code relative to that feature here
Então("devo uma lista com os professores desse curso") do
  expect(page).to have_content(@course.name)
  expect(page).to have_content(@professor.name)
end
