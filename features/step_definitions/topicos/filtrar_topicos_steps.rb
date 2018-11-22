Dado("que eu esteja na página de Fóruns") do
  visit topics_path
end
Dado("eu selecionar o curso {string}") do |course_name|
  select course_name, from: "Curso:", visible: false
end
Dado("eu selecionar a matéria {string}") do |subject_name|
  select subject_name, from:  "Matéria:"
end
Dado("eu selecionar o professor {string}") do |professor_name|
  select professor_name, from: "Professor:"
end

