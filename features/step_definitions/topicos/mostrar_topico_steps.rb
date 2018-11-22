Dado("que exista um usuário") do 
    steps %Q{
    Dado que eu esteja na página inicial
      Quando eu clicar no link "Entrar"
      E eu clicar no link "Novo usuário? Cadastre-se"
      E preencher o formulário com:
      |user_email|nicknish@hotmail.com     |
      |user_matricula |150019343           |
      |user_first_name      |Nicholas      |
      |user_last_name       |Marques       |
      |user_password  |123456              |
      |user_password_confirmation|123456   |
      E selecionar o meu curso "CIÊNCIA DA COMPUTAÇÃO"
      E clicar no botão "Cadastrar-se"
    }
    @user = User.find_by(matricula: "150019343")
end

Dado("que exista um tópico criado por este usuário com os campos:") do |table|
    @topic = Topic.new
    table.rows_hash.each do |field,value|
        @topic[field] = value
    end
    @topic["user_id"] = @user.id
    @topic.save 
end

Dado("que exista uma resposta com os campos:") do |table|
    @response = Topic.new
    table.rows_hash.each do |field,value|
        @response[field] = value
    end
    @response["user_id"] = @user.id
    @response["topic_id"] = @topic.id
    @response.save
end

Dado("que eu entre na página deste tópico") do
    visit topic_path(@topic.id)
end

Entao("eu devo ver os dados:") do |table|
  table.rows_hash.each do |field,value|
    expect(page).to have_content(value)
  end
end