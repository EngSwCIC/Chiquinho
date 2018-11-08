Dado("que exista um professor criado com os atributos:") do |table|
  @professor = Professor.new
  table.rows_hash.each do |field,value|
    @professor[field] = value
  end
  @professor.save
end
Dado("que exista uma materia criada com os atributos:") do |table|
  @subject = Subject.new
  table.rows_hash.each do |field,value|
    @subject[field] = value
  end
  @subject.save
end
Dado("que exista um curso criado com os atributos:") do |table|
  @course = Course.new
  table.rows_hash.each do |field,value|
    @course[field] = value
  end
  @course.save
end

Dado("que exista para esse professor o topico:") do |table|
  @topic_professor = Topic.new
  table.rows_hash.each do |field,value|
    @topic_professor[field] = value
  end
  @topic_professor[:professor_id] = @professor.id
  @topic_professor.save
end
Dado("que exista para essa materia o topico:") do |table|
  @topic_subject = Topic.new
  table.rows_hash.each do |field,value|
    @topic_subject[field] = value
  end
  @topic_subject[:subject_id] = @subject.id
  @topic_subject.save
end
Dado("que exista para esse curso o topico:") do |table|
  @topic_course = Topic.new
  table.rows_hash.each do |field,value|
    @topic_course[field] = value
  end
  @topic_course[:course_id] = @course.id
  @topic_course.save
end

Dado("que eu esteja na pagina desse professor") do
  visit professor_path(@professor.id)
end
Dado("que eu esteja na pagina dessa materia") do
  visit subject_path(@subject.id)
end
Dado("que eu esteja na pagina desse curso") do
  visit course_path(@course.id)
end

Entao("eu devo ver o topico desse professor:") do |table|
  table.rows_hash.each do |field,value|
    expect(page).to have_content(value)
  end
end
Entao("eu devo ver o topico dessa materia:") do |table|
  table.rows_hash.each do |field,value|
    expect(page).to have_content(value)
  end
end
Entao("eu devo ver o topico desse curso:") do |table|
  table.rows_hash.each do |field,value|
    expect(page).to have_content(value)
  end
end