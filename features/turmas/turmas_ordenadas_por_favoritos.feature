#language: pt
#encoding: utf-8

Funcionalidade: Ordenar turmas por professor favorito
  Como usuário autenticado
  Para que eu escolha mais facilmente uma turma
  Eu quero ver primeiro turmas com meus professores favoritos

  #index
  Cenário: Listar turmas por ordem de professor favorito
    Dado que eu tenha me cadastrado e me autenticado
    E que eu tenha uma matéria criada com os atributos:
      |code   |116327                 |
      |name   |ORGANIZAÇÃO DE ARQUIVOS|
      |credits|002 002 000 004        |
      |area   |AC                     |
    E essa matéria tenha as turmas:
      |turmas |professor              |
      |A      |Caio                   |
      |B      |João                   |
    E que eu tenha favoritado o professor "João"
    Então devo ver a turma do "João" antes da turma do "Caio"
