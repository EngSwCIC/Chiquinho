#language: pt
#encoding: utf-8

Funcionalidade: Sistema de Matérias
  Como usuário não autenticado
  Para que eu tenha mais informações sobre as matérias da UnB
  Eu quero ver a lista de matérias e cada matéria individualmente

  #index
  Delineação do Cenário: Listar todos as materia
    Dado que eu tenha uma lista de matérias "<code>", "<name>", "<credits>", "<area>"
    E que eu esteja na página inicial
    Quando eu clicar no link "Explorar Matérias"
    Então eu devo ver a lista completa com as matérias "<code>", "<name>", "<credits>", "<area>"
    Exemplos:
      |code  |name                          |credits        |area|
      |116327|ORGANIZAÇÃO DE ARQUIVOS       |002 002 000 004|AC  |
      |115045|PROBABILIDADE E ESTATÍSTICA   |002 002 000 006|DC  |
      |117935|PROGRAMAÇÃO CONCORRENTE       |002 002 000 000|AC  |
      |117536|PROJETO ANÁLISE DE ALGORITMOS |004 000 000 004|AC  |
  #show
  Cenário: Mostrar uma materia
