Dado("que eu esteja no fórum do curso de {string}") do |course_name|
    course_params = {kind: "Presencial", code: 370, name: "CIÊNCIA DA COMPUTAÇÃO", turn: "Diurno", classification: "exatas", opcode: nil}
    Course.create(course_params)
    course = Course.find_by(name: course_name)
    visit course_path(course)
end
  
Quando("preencher o fórmulário com:") do |table|
    table.rows_hash.each do |field,value|
        fill_in field,	with: value 
    end
end
  
Então("eu devo ser redirecionado para a página de fórum") do
    course_params = {kind: "Presencial", code: 370, name: "CIÊNCIA DA COMPUTAÇÃO", turn: "Diurno", classification: "exatas", opcode: nil}
    Course.create(course_params)
    course = Course.find_by(name: course_params[:name])
    expect(current_path).to eq(course_forums_path(course))
end
  
Então("ver os dados:") do |table|
    table.rows_hash.each do |field,value|
        expect(page).to have_content(value)
    end
end