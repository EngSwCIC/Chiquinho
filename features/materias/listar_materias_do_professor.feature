#language: pt
#encoding: utf-8

Funcionalidade: Ver as materias ministradas por um determinado professor
  Como usuario não autenticado
  Para que eu possa me informar das materias ministradas por algum professor
  Eu quero ver cards das materias ministradas por um professor ao acessar o seu perfil

  Delineacao do Cenario: Cenario: Ver as materias ministardas por um professor
    Dado que exita um professor criado com os atributos:
      |name|João|
    E que ele ministre as materias "<code>", "<name>", "<credits>", "<area>"
    E que esteja na pagina de listagem de professores
    Quando eu clicar no link de detalhes do professor "João"
    Então eu devo ver a cards das materias ministradas por esse professor "<code>", "<name>", "<credits>", "<area>"

    Exemplos:
      |code  |name                          |credits        |area|
      |116327|ORGANIZAÇÃO DE ARQUIVOS       |002 002 000 004|AC  |
      |115045|PROBABILIDADE E ESTATÍSTICA   |002 002 000 006|DC  |
      |117935|PROGRAMAÇÃO CONCORRENTE       |002 002 000 000|AC  |
      |117536|PROJETO ANÁLISE DE ALGORITMOS |004 000 000 004|AC  |