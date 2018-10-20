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
    E que eu esteja na página de matérias
    E que existam turmas para essa matéria com o nome "<name>"
    Entao devo ver uma lista contendo as turmas "<name>", "<schedule>", "<professor>"

    Exemplos:
    |name |schedule       |professor               |
    |A    |Ter, Qui - 14h |PEDRO DE AZEVEDO BERGER |
    |C    |Seg, Qua - 14h |CAMILO CHANG DOREA      |
