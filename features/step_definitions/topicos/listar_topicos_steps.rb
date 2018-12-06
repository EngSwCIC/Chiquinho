Dado("que existam os topicos criados com os campos:") do |table|
  table.rows_hash.each do |title, description|
    @topic = Topic.create(title: title, description: description)
  end
end
Entao("eu devo ver a lista completa com os topicos") do |table|
  table.rows.each do |field, title|
    expect(page).to have_content(title)
  end
end
Dado("que não existam tópicos") do
end

Entao("eu não devo ver a lista com os topicos") do |table|
  table.rows.each do |field, title|
    expect(page).to have_no_content(field)
  end
end
Quando("eu revisitar a página") do
  visit topics_path
end
Quando("eu clicar em {string}") do |link|
  click_on link
end