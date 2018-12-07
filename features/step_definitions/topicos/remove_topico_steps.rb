Então("eu devo ver a mensagem {string}") do |arg|
  page.should have_content(arg)
end

Entao("eu não devo mais ver os dados:") do |table|
  table.rows_hash.each do |field, value|
    page.should_not have_content(value)
  end
end