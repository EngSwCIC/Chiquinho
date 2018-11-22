# This is the steps file referred to ver_professores_do_meu_curso feature
# Place your code relative to that feature here
Dado("que exista o departamento {string} com professores:") do |depto, table|
  @department = Department.create(name: depto)
  table.hashes.each do |row|
    Professor.create(name: row["nome"], departments_id: @department.id)
  end
end

Dado("que os professores tenham avaliação nas matérias:") do |table|
  table.hashes.each do |row|
    @subject = Subject.find_or_create_by(name: row["materia"])
    @professor = Professor.find_by(name: row["professor"])
    @professor_subject = ProfessorSubject.find_or_create_by(professor_id: @professor.id, subject_id: @subject.id)
    @user = User.create()
    @asdf = ProfessorSubjectUser.create!(user: @user, professor_subject: @professor_subject, trabalhos: row["trabalhos"], provas: row["provas"], tarefas: row["tarefas"], professor_id: @professor.id)
  end
end

Dado("dado que exista o curso {string} do {string}") do |curso, depto|
  @department = Department.find_by(name: depto)
  @course = Course.create(name: curso, departments_id: @department.id)
end

Dado("que eu esteja na página do curso") do
  visit course_path(@course)
end

Quando("clicar para ver professores do curso") do
  click_link("Ver Professores do Curso")
end

Então("devo ver os professores do {string}") do |depto|
  @department = Department.find_by(name: depto)
  @professors = Professor.where(departments_id: @department.id)
  @professors.each do |professor|
    expect(page).to have_content(professor.name)
  end
end

Então("não devo ver os professores do {string}") do |depto|
  @department = Department.find_by(name: depto)
  @professors = Professor.where(departments_id: @department.id)
  @professors.each do |professor|
    expect(page).not_to have_content(professor.name)
  end
end

Então("devo ver {string} na frente da {string}") do |string, string2|
  expect(page.body.index(string) >= page.body.index(string2)).to eq(false)
end

Dado("que os professores recebam os seguintes favoritos:") do |table|
  table.hashes.each do |row|
    row[:nfavoritos].to_i.times {
      ProfessorUserFavorite.create!(professor_id: Professor.find_by(name: row[:nome]).id, user: User.new)
    }
  end
end

Então("devo ver {string} com {string} de score") do |professor, score|
  expect(page).to have_content("#{professor} #{score}")
end

