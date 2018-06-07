# This is the steps file referred to ver_professores_do_meu_curso feature
# Place your code relative to that feature here
Então("devo uma lista com os professores desse curso") do
  expect(page).to have_content(@course.name)
  expect(page).to have_content(@professor.name)
end
Dado("que exista um coordenador do curso com os campos:") do |table|
  @coordinator = Professor.new
  table.rows_hash do |field, value|
    @coordinator[field] = value
  end
  @coordinator.save
  @course.professors_id = @coordinator.id
  @coordinator.courses_id = @course.id
  @course.save
  @coordinator.save
end
