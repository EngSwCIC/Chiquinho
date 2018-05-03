#language: pt
#encoding: utf-8

Funcionalidade: listar todos os professores do sistema
  Como estudante da unb
  Para que eu possa ter acesso aos professores da unb
  Eu quero poder ter acesso a uma lista com todos os professore de 25 em 25

  Delineacao do Cenario: o usuario ve uma lista completa de professores
    Dado que eu esteja na página inicial
    E que existam professores com campos "<name>"
    Quando eu clicar no link "Ver Professores"
    Entao eu devo ver a lista completa com os professores "<name>"

    Exemplos:
    |name    |
    |Maria   |
    |Joao    |
    |Jose    |
    |Fernanda|
