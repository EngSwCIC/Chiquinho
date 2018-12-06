Dado("que eu seja um usuário autenticado") do 
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

Quando("eu alterar os dados no formulário para:") do |table|
  table.rows_hash.each do |field,value|
      fill_in field,  with: value 
  end
end

Dado("eu devo ser redirecionado para a página do tópico") do
  visit topic_path(@topic.id)
end