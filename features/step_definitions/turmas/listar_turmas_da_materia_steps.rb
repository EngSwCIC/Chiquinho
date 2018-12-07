# This is the steps file referred to listar_turmas_da_materia feature
# Place your code relative to that feature here

Dado("que eu esteja na página dessa matéria") do
  visit subject_path(@subject.id)
end

Dado("que existam as turmas {string}, {string}, {string} para essa matéria") do
  |name, schedules, professor|
  @professor = Professor.find_or_create_by(name: professor)
  @class = SubjectClass.create(name: name, subject_id: @subject.id,
                        professor_id: @professor.id)

  schedules.split(", ").each {
    |schedule|
    week_day, class_hour = schedule.split(" - ")
    @week = WeekDay.find_or_create_by(day: week_day)
    @hour = ClassHour.find_or_create_by(hour: class_hour)
    ClassSchedule.create(subject_class_id: @class.id, week_day_id: @week.id,
                         class_hour_id: @hour.id)
  }

end

Então("eu devo ver uma lista contendo as turmas {string}, {string}, {string}") do
  |name, schedules, professor|
  expect(page).to have_content("Turma " + name)
  schedules.split(", ").each {
    |schedule|
    week_day, class_hour = schedule.split(" - ")
    class_end_hour = (Time.parse(class_hour) + 110.minutes).strftime("%H:%M")
    expect(page).to have_content(week_day.capitalize + " " + class_hour + " - " + class_end_hour)
  }
  expect(page).to have_content(professor)
end

Então("eu devo ver uma lista vazia de turmas") do
  expect(page).to have_content("Turmas")
  expect(page).to have_content("Não há turmas para essa disciplina!")
end
