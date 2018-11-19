#language: pt
#encoding: utf-8

Funcionalidade: Listar turmas da materia
  Como usuário autenticado
  Para que eu possa comparar as turmas de uma materia
  Eu quero ver a lista com as turmas de uma materia quando eu seleciona-la

  Delineação do Cenário:
    Dado que eu tenha me cadastrado e me autenticado
    E que eu tenha uma matéria criada com os atributos:
      |code   |116327                 |
      |name   |ORGANIZAÇÃO DE ARQUIVOS|
      |credits|002 002 000 004        |
      |area   |AC                     |
    E que eu esteja na página dessa matéria
    E que existam as turmas "<name>", "<schedule>", "<professor>" para essa matéria
    Entao devo ver uma lista contendo as turmas "<name>", "<schedule>", "<professor>"

    Exemplos:
    |name |schedule                        |professor               |
    |A    |terça - 14:00, quinta - 14:00   |PEDRO DE AZEVEDO BERGER |
    |C    |segunda - 14:00, quarta - 14:00 |CAMILO CHANG DOREA      |
