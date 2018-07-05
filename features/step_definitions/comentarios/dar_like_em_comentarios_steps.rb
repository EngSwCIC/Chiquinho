# This is the steps file referred to dar_like_em_comentarios feature
# Place your code relative to that feature here
Dado("que exista um profesor com os campos:") do |table|
  @professor = Professor.new
  table.rows_hash.each do |field, value|
    @professor[field] = value
  end
  @professor.save
end

Dado("que esse professor ministre uma materia com os campos:") do |table|
  @subject = @professor.subjects.new
  table.rows_hash.each do |field, value|
    @subject[field] = value
  end
  @subject.save
  @subject.professors << @professor
  @professor.subjects << @subject
  @professor.save
  @subject.save
end

Dado("que exista um comentario da materia ministrada por esse professor com os campos:") do |table|
  @comment = Comment.new
  table.rows_hash.each do |field, value|
    @comment[field] = value
  end
  @comment.save
  @professor_subject = ProfessorSubject.where(professor_id: @professor.id, subject_id: @subject.id).first
  @professor_subject.comments << @comment
  @professor_subject.save
  @user.comments << @comment
  @comment.save
end

Dado("que eu esteja na pagina de vizualização da materia ministrada por esse professor") do
  visit subject_professor_path(id: @professor.id, subject_id: @subject.id)
end

Quando("eu clicar no botão de like") do
  path = like_path(user_id: @user.id, comment_id: @comment.id)
  link = "a[href=\'#{path}\']"
  puts link
  first(link).click
end

Então("quero ver o numero de likes ser igual a um") do
  expect(page).to have_content(1)
end
