# This is the steps file referred to mostrar_cursos_de_um_departamento feature
# Place your code relative to that feature here
Dado("que eu exista um curso daquele departamento com os campos:") do |table|
  @course = Course.new
  table.rows_hash.each do |field, value|
    @course[field] = value
  end
  @course.departments_id = @department.id
  @course.save
  @course.id
end

Então("devo ver o nome do curso na pagina") do
  expect(page).to have_content(@course.name)
end
