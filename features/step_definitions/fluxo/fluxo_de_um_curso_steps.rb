# This is the steps file referred to fluxo_de_um_curso feature
# Place your code relative to that feature here

Dado("que tenha o curso {string}") do |nome_curso|
  @course = Course.create(
    :kind=>"Presencial",
    :code=>"370",
    :name=>nome_curso,
    :turn=>"Diurno")
  expect(Course.find_by(name: nome_curso)).to eq(@course)
end

Dado("que tenha as seguintes matérias:") do |table|
  @flows = []
  table.rows.each do |code, name, credits, area, semester|
    @subject = Subject.create(
      :code=>code,
      :name=>name,
      :credits=>credits,
      :area=>area,
      :ementa=>"A ser definida")
    expect(Subject.find_by(code: code)).to eq(@subject)
    @flows << Flow.create(:subject=>@subject, :course=>@course, :semester=>semester)
    expect(Flow.find_by(course_id: @course.id)).to eq(@flows[0])
  end
end

Dado("que eu estou na página do curso {string}") do |nome_curso|
  course = Course.find_by(name: nome_curso)
  visit course_path(course)
end

Quando("eu acessar a página do curso {string}") do |nome_curso|
  course = Course.find_by(name: nome_curso)
  visit course_path(course)
end

Então("eu devo ver as seguintes matérias:") do |table|
  expect(page.find("div[id='flow']").text).not_to eq("")
  table.rows.each do |td|
    td.each do |content|
      expect(page).to have_content(content)
    end
  end
end

Então("o fluxo deve estar vazio") do
  expect(page.find("div[id='flow']").text).to eq("")
end

Então("eu devo ver {string}") do |conteudo|
  expect(page).to have_content(conteudo)
end
