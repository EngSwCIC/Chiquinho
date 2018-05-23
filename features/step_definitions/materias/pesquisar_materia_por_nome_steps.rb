# frozen_string_literal: true

Dado("que eu esteja na pagina inicial") do
  visit(root_path)
end

Dado("que exista uma matéria com os atributos:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  @subject = Subject.new
  table.rows_hash.each do |field, value|
    @subject[field] = value
  end
  @subject.save
end

Quando("eu preencher o form com:") do |table|
  table.rows_hash.each do |field, value|
    fill_in(field, with: value)
  end
end

Quando("clicar no link {string}") do |string|
  find('#search-subject-button').click()
end

Entao("eu devo ver os dados da matéria:") do |table|
  table.rows_hash.each do |field, value|
    expect(page).to have_content(value)
  end
end