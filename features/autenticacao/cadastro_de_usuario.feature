#language: pt
#encoding: utf-8
@cadastro
Funcionalidade: Cadastro de Usuário
  Como usuário não autenticado
  Para que eu possa comentar sobre uma matéria ou compartilhar conteúdo da matéria
  Eu quero me cadastrar no sistema

  Cenário: Cadastro efetuado com sucesso
    Dado que eu esteja na página inicial
    Quando eu clicar no link "Cadastrar"
    E preencher o formulário com:
    |user_email|nicknish@hotmail.com     |
    |user_matricula |150019343           |
    |user_first_name      |Nicholas      |
    |user_last_name       |Marques       |
    |user_password  |123456              |
    |user_password_confirmation|123456   |
    E clicar no botão "Cadastrar-se"
    Então eu devo ser redirecionado para página inicial
    E devo ver os conteúdos "Login efetuado com sucesso. Se não foi autorizado, a confirmação será enviada por e-mail." e meu primeiro nome "Nicholas Marques"
