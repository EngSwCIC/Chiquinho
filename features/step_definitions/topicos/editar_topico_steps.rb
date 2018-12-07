Dado("que eu seja um usuário autenticado") do 
  steps %Q{
  Dado que eu esteja na página inicial
    Quando eu clicar no link "Entrar"
    E eu clicar no link "Novo usuário? Cadastre-se"
    E preencher o formulário com:
    |user_email|user1@hotmail.com        |
    |user_matricula |150000001           |
    |user_first_name      |User          |
    |user_last_name       |1             |
    |user_password  |123456              |
    |user_password_confirmation|123456   |
    E selecionar o meu curso "CIÊNCIA DA COMPUTAÇÃO"
    E clicar no botão "Cadastrar-se"
  }
  @user = User.find_by(matricula: "150000001")
end

Dado("eu me cadastre como outro usuário") do
  steps %Q{
  Dado que eu esteja na página inicial
    Quando eu clicar no link "Entrar"
    E eu clicar no link "Novo usuário? Cadastre-se"
    E preencher o formulário com:
    |user_email|user2@hotmail.com        |
    |user_matricula |150000002           |
    |user_first_name      |User          |
    |user_last_name       |2             |
    |user_password  |123456              |
    |user_password_confirmation|123456   |
    E selecionar o meu curso "CIÊNCIA DA COMPUTAÇÃO"
    E clicar no botão "Cadastrar-se"
  }
  @user = User.find_by(matricula: "150000002")
end

Dado("eu devo ser redirecionado para a página do tópico") do
  visit topic_path(@topic.id)
end

Dado("que eu responda este tópico com o texto:") do |table|
  @response = Topic.new
  @response["topic_id"] = @topic.id
  table.rows_hash.each do |field,value|
    @response[field] = value
  end
  @response["user_id"] = @user.id
  @response.save 
end

Quando("eu alterar os dados no formulário para:") do |table|
  table.rows_hash.each do |field,value|
      fill_in field,  with: value 
  end
end

Então("eu não devo ver o botão {string}") do |arg|
  page.should_not have_content(arg)
end

Dado("eu esteja na página inicial") do
  #Course.create(:kind=>"Presencial", :code=>"370", :name=>"CIÊNCIA DA COMPUTAÇÃO", :turn=>"Diurno")
  visit root_path
end