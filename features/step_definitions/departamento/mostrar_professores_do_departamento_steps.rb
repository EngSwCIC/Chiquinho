# This is the steps file referred to mostrar_professores_do_departamento feature
# Place your code relative to that feature here

Dado("que eu exista um professor daquele departamento com os campos:") do |table|
  @professor = Professor.new
  table.rows_hash.each do |field, value|
    @professor[field] = value
  end
  @professor.departments_id = @department.id

  @professor.save
end

Então("devo ver o nome do professor na pagina") do
  expect(page).to have_content(@professor.name)
end

Quando("eu clicar em Detalhes do respectivo departamento") do
  path = department_path(@department)
  link = "a[href=\'#{path}\']"
  first(link).click
end
