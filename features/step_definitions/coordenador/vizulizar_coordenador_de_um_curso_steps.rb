# This is the steps file referred to vizulizar_orientador_de_um_curso feature
# Place your code relative to that feature here
Dado("que exista o curso com os campos:") do |table|
  @course = Course.new
  table.rows_hash.each do |field,value|
    @course[field] = value
  end
  @course.save
end

Dado("que exista um professor que seja o orientador desse curso com os campos:") do |table|
  @professor = Professor.new
  table.rows_hash.each do |field,value|
    @professor[field] = value
  end
  @professor.save
  @course.professors_id = @professor.id
  @professor.courses_id = @course.id
  @course.save
  @professor.save
end

Dado("que eu esteja na pagina de vizualização desse curso") do
  @course.save
  visit course_path(@course)
end

Então("devo um card com o nome do orientador") do
  expect(page).to have_content(@professor.name)
end
