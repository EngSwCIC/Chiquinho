# This is the steps file referred to tela_de_perfil feature
# Place your code relative to that feature here
#
Dado("que eu tenha me cadastrado previamente como {string}, senha {string}, matricula: {string}, nome: {string}, sobrenome: {string} e curso: {string}") do |email, password, matricula, name, last_name, course_name|
  @course = Course.create(name: course_name)
  @user = User.create(email: email, password: password, matricula: matricula, first_name: name, last_name: last_name,course_id: Course.find_by(name: course_name).id)
end

Dado("eu me autentique no sistema") do
  visit new_user_session_path
  fill_in :user_email,with: @user.email
  fill_in :user_password,with: @user.password
  click_button "Entrar"
end

Então("eu devo ver campos para edição do meu perfil:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.rows_hash.each do |field,value|
    expect(page).to have_content value
  end
end

Então("uma mini-grade horária com matérias que estou fazendo-desejo fazer") do
  expect(page).to have_content "Grade Horária"
end
