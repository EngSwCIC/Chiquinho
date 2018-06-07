# This is the steps file referred to mostrar_detalhes_do_departamento feature
# Place your code relative to that feature here
Dado("que eu exista um departamento com os campos:") do |table|
  @department = Department.new
  table.rows_hash.each do |field, value|
    @department[field] = value
  end
  @department.save
end

Dado("que eu esteja na pagina de listagem de departamentos") do
  visit(department_index_path)
end

Então("devo ver uma pagina do departamento com os dados:") do |table|
    table.rows_hash.each do |field, value|
        expect(page).to have_content(value)
    end
end



