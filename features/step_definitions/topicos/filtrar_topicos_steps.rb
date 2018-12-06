Dado("que eu esteja na página de Fóruns") do
  visit topics_path
end
Dado("eu selecionar o curso {string}") do |course_name|
  #find('select#course_id').find(:option, course_name).select_option
  page.find(:select, 'course_id').first(:option, course_name)
end
Dado("eu selecionar a matéria {string}") do |subject_name|
  #page.find('select#subject_id', subject_name)
  page.find(:select, 'subject_id').first(:option, subject_name)
end
Dado("eu selecionar o professor {string}") do |professor_name|
  #page.find('select#professor_id', professor_name)
  page.find(:select, 'professor_id').first(:option, professor_name)
end
Dado("não devo ver os dados:") do |table|
  table.rows_hash.each do |field, value|
    expect(page).to have_content(value)
  end
end

