Dado("que exista o professor de nome {string}") do |string|
  @professor = Professor.create(name: string)
end

Dado("que eu esteja em sua página de perfil") do
  visit(professor_path(@professor))
end

Quando("eu clicar no botão de adicionar aos favoritos") do
  find('a[title="Adicionar aos Favoritos"]').click
end

Quando("eu clicar no botão remover dos favoritos") do
  find('a[title="Remover dos Favoritos"]').click
end

Então("devo ver em sua página a messagem {string}") do |messagem|
  expect(page).to have_content messagem
end

Dado("que ele já esteja marcado como favorito") do
  ProfessorUserFavorite.create(professor_id: @professor.id, user_id: @user.id)
end

