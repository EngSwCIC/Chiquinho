# This is the steps file referred to editar_perfil feature
# Place your code relative to that feature here
#
Dado("que eu tenha um curso criado com os atributos {string}") do |course_name|
  @course = Course.create(name: course_name)
end

Quando("eu clicar no link para meu perfil") do
  path = edit_user_registration_path
  link = "a[href=\'#{path}\']"
  find(link).click
end

Quando("escolher o curso {string}") do |course_name|
  select course_name, from: "user[course_id]"
end

Então("devo ver os dados:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.rows_hash.each do |field,value|
    expect(find_field(field).value).to eq value
  end
end
