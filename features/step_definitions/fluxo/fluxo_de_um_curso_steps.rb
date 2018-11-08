# This is the steps file referred to fluxo_de_um_curso feature
# Place your code relative to that feature here

Dado("que eu estou na página do curso {string}") do |nome_curso|
  @course = Course.create(
    :kind=>"Presencial",
    :code=>"370",
    :name=>nome_curso,
    :turn=>"Diurno")
  expect(Course.first).to eq(@course)
  visit course_path(@course)
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
    @flows << Flow.create(:subject=>@subject, :course=>@course, :semester=>semester.to_i)
    expect(Flow.find_by(course_id: @course.id)).to eq(@flows[0])
  end
end

Quando("eu clicar no link de url {string}") do |url|
  #find('div.panel-body#flow>nav>ul.pagination.justify-content-center>li.page-item>a[href="'+url+'"]').click
  #link = "a[href=\'#{url}\']"
  #find(link).click
end

Então("eu devo ver as seguintes matérias:") do |table|
  expect(page.find("div[id='flow']")).not_to eq("")
  table.rows.each do |td|
    td.each do |content|
      expect(page.find("div#flow")).to have_content(content)
    end
  end
end
