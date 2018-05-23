#language: pt
#encoding: utf-8

Funcionalidade: Pesquisar matéria por nome
  Como usuário não autenticado
  Para poder encontrar dados sobre uma matéria
  Eu quero poder pesquisar uma matéria pelo nome dela

  Cenario: Achar uma matéria cadastrada no sistema
  Dado que eu esteja na pagina inicial
  E que exista uma matéria com os atributos:
    |area   |AC|
    |code   |116327|
    |credits|002 002 000 004|
    |name   |ORGANIZAÇÃO DE ARQUIVOS|
  Quando eu preencher o form com:
    |search-bar|Org|
  E clicar no link "Pesquisar"
  Entao eu devo ver os dados da matéria:
    |area   |AC|
    |code   |116327|
    |credits|002 002 000 004|
    |name   |ORGANIZAÇÃO DE ARQUIVOS|