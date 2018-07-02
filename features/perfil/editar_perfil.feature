#language: pt
#encoding: utf-8

Funcionalidade: Editar perfil
  Como usuário autenticado
  Para que eu possa editar os dados do meu perfil
  Eu quero ter acesso à pagina do meu perfil para alterar nome, sobrenome, matricula e curso


  Cenário de Fundo:
    Dado que eu tenha me cadastrado e me autenticado
    E que eu esteja na página inicial
  Cenário:
    Dado que eu tenha um curso criado com os atributos "ENGENHARIA DA COMPUTAÇÃO"
    Quando eu clicar no link para meu perfil
    E preencher o formulário com:
      |user_first_name|Diogo    |
      |user_last_name |Queiroz  |
      |user_matricula|15/0123418|
    E escolher o curso "ENGENHARIA DA COMPUTAÇÃO"
    E clicar no botão "Atualizar Dados"
    Então eu devo ver uma mensagem dizendo "Sua conta foi atualizada com sucesso."
    E devo ver os dados:
      |user_matricula|15/0123418|
      |user_first_name|Diogo    |
      |user_last_name |Queiroz  |
