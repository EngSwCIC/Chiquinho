Dado("que eu esteja no fórum do curso de {string}") do |course|
    course = Course.find_by(name: course)
    visit courses_path(course)
end
  
Quando("preencher o fórmulário com:") do |table|
    table.rows_hash.each do |field,value|
        fill_in field,	with: value 
    end
end
  
Então("eu devo ser redirecionado para a página do tópico") do
    expect(current_path).to eq(topic_path(Topic.last))
end
  
Então("ver os dados:") do |table|
    table.rows_hash.each do |field,value|
        expect(page).to have_content(value)
    end
end