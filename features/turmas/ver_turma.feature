#language: pt
#encoding: utf-8

Funcionalidade: Ver turma
  Como usuário autenticado
  Para que eu possa visualizar os detalhes de uma turma
  Eu quero poder acessar a página de uma turma

  Delineação do Cenário: Acessar a página de uma turma
    Dado que eu tenha me cadastrado e me autenticado
    E que eu tenha uma matéria criada com os atributos:
      |code   |116327                 |
      |name   |ORGANIZAÇÃO DE ARQUIVOS|
      |credits|002 002 000 004        |
      |area   |AC                     |
    E que eu esteja na página de matérias
    E que existam turmas para essa matéria com o nome "<name>"
    Quando eu clicar no link de detalhes da turma "<name>"
    Então devo ir pra uma pagina com detalhes sobre a turma "<name>"

    Exemplos:
      |name|
      |A   |
      |B   |
      |C   |
