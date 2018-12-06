Entao("eu não devo mais ver os dados:") do |table|
  table.rows_hash.each do |field,value|
    expect(page).not_to have_content(value)
  end
end