# This is the steps file referred to link_para_adicionar_turma_a_grade feature
# Place your code relative to that feature here

Dado("que eu tenha uma turma criada com os atributos:") do |table|
  @subject_class = SubjectClass.new

  table.rows_hash.each do |field,value|

    if field == "name"
      @subject_class[field] = value
    elsif field == "professor"
      professor = Professor.create(name: value)
      @subject_class['professor_id'] = professor.id
    elsif field == "course"
      @subject_class['subject_id'] = Subject.find_by_name(value).id
    elsif field == "schedule"
      @subject_class.save!
      day = WeekDay.create(day: value.split(' - ')[0])
      hour = ClassHour.create(hour: value.split(/(\s-\s)|h/)[1])
      ClassSchedule.create(subject_class_id: @subject_class.id, week_day_id: day.id, class_hour_id: hour.id)
    end

  end
end

Quando("eu clicar no link para detalhes dessa turma") do
  path = subject_class_path(@subject_class.id)
  link = "a[href=\"#{path}\"]"
  find(link).click
end

Então("eu devo ver um botão que me permita adicionar a turma a grade horária") do
  path = add_class_schedule_path(@subject_class.id)
  link = "a[href=\"#{path}\"]"
  expect(page).to have_selector(link)
end
