#language: pt
#encoding: utf-8

Funcionalidade: Marcar um professor como favorito
  Como usuario autenticado
  Para que eu priorize na listagem de turmas aquelas com meus professores favoritos
  Eu quero poder marcar um professor como favorito

  Cenário: Marcar um professor ainda não marcado pela sua página de
    Dado que eu tenha me cadastrado previamente como "nick-nish@hotmail.com", senha "123456", matricula: "15/0019343", nome: "Nicholas", sobrenome: "Marques" e curso: "CIÊNCIA DA COMPUTAÇÃO"
    E eu me autentique no sistema
    E que exista o professor de nome "ALEXANDRE ZAGHETTO"
    E que eu esteja em sua página de perfil
    Quando eu clicar no botão de adicionar aos favoritos
    Então devo ver em sua página a messagem "Professor adicionado aos favoritos com sucesso!"

  Cenário: Desmarcar um professor já marcado pela sua página de perfil
    Dado que eu tenha me cadastrado previamente como "nick-nish@hotmail.com", senha "123456", matricula: "15/0019343", nome: "Nicholas", sobrenome: "Marques" e curso: "CIÊNCIA DA COMPUTAÇÃO"
    E eu me autentique no sistema
    E que exista o professor de nome "ALEXANDRE ZAGHETTO"
    E que ele já esteja marcado como favorito
    E que eu esteja em sua página de perfil
    Quando eu clicar no botão remover dos favoritos
    Então devo ver em sua página a messagem "Professor removido dos favoritos com sucesso!"

  Cenário: Marcar um professor como favorito não estando logado
    Dado que exista o professor de nome "ALEXANDRE ZAGHETTO"
    E que eu esteja em sua página de perfil
    Então eu não devo ver um botão de adicionar aos favoritos

  Delineacao do Cenario: Ver professor favorito em primeiro na lista de professores
    Dado que eu tenha me cadastrado previamente como "nick-nish@hotmail.com", senha "123456", matricula: "15/0019343", nome: "Nicholas", sobrenome: "Marques" e curso: "CIÊNCIA DA COMPUTAÇÃO"
    E eu me autentique no sistema
    E que exista o professor de nome "ALEXANDRE ZAGHETTO"
    E que eu esteja em sua página de perfil
    E eu clicar no botão de adicionar aos favoritos
    Dado que eu esteja na página inicial
    E que existam professores com campos "<name>"
    E eu clicar no link "Ver Professores"
    Então devo ver "ALEXANDRE ZAGHETTO" antes de "<name>"

    Exemplos:
    |name    |
    |Maria   |
    |Joao    |
    |Jose    |
    |Fernanda|