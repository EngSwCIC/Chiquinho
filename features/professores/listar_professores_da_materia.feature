#language: pt
#encoding: utf-8

Funcionalidade: listar_professores_da_materia
  Como usuario do sitema
  Para que eu possa saber quais professores ministram uma determinada materia
  Eu quero poder ver cards dos professores que ministram essa materia quando seleciona-la

  Delineacao do Cenario: o usuario ve cards dos professores que ministram a materia selecionada
    Dado  que eu tenha uma matéria criada com os atributos:
      |code   |116327                 |
      |name   |ORGANIZAÇÃO DE ARQUIVOS|
      |credits|002 002 000 004        |
      |area   |AC                     |
    E que eu esteja na página de matérias
    E que exitam professores que ministrem essa materia com campos "<name>"
    Quando eu clicar no link para detalhes daquela matéria
    Entao devo ver cards com todos os professores que ministram aquela materia "<name>"
    Exemplos:
    |name    |
    |Joao    |
    |Maria   |
    |Jose    |
    |Fernanda|


