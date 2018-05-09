# This is the steps file referred to materias_por_curso feature
# Place your code relative to that feature here

Dado("tenha um curso criado:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  @course = Course.new
  table.rows.each do |row|
    row.each_with_index do |td,idx|
      @course[table.headers[idx]] = td
    end
  end
  @course.save
end

Dado("que eu esteja na página de cursos") do
  visit courses_path
end

Dado("com as matérias dele:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  @subject1 = Subject.new
  table.rows[0].each_with_index do |td,idx|
    @subject1[table.headers[idx]] = td
  end
  @subject1.save

  @subject2 = Subject.new
  table.rows[1].each_with_index do |td,idx|
    @subject2[table.headers[idx]] = td
  end
  @subject2.save

  CourseSubject.create(subject_id: @subject1.id,course_id: @course.id, kind: 0)
  CourseSubject.create(subject_id: @subject2.id,course_id: @course.id, kind: 1)
end

Quando("eu clicar no link para detalhes daquele curso") do
  path = course_path(@course.id)
  link = "a[href=\'#{path}\']"
  find(link).click
end

Então("eu devo ver os dados do curso:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.rows.each do |row|
    row.each do |td|
      expect(page).to have_content td
    end
  end
end

Então("eu devo ver a lista completa das matérias deste curso:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.rows.each do |row|
    row.each do |td|
      expect(page).to have_content td
    end
  end
end
