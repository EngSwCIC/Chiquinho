# This is the steps file referred to comentarios_da_materia_de_um_professor feature
# Place your code relative to that feature here
Dado("que ela é ministrada por um professor criado com os atributos:") do |table|
  @professor = Professor.new
  table.rows_hash.each do |field, value|
    @professor[field] = value
  end
  @professor.subjects << @subject
  @subject.professors << @professor
  @professor.save
  @subject.save
end

Dado("que eu esteja na pagina de vizualização dessa materia") do
  visit subject_path(id: @subject.id)
end

Quando("eu preencher o campo de comentario com:") do |table|
  table.rows_hash.each do |field,value|
    fill_in field, with: value, visible: false
  end
end

Então("devo ver o meu comentario {string} na pagina de vizualização da matéria") do |comment|
  extend(page).to have_content(comment)
end
