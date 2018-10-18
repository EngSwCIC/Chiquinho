#language: pt
#encoding: utf-8

Funcionalidade: Marcar um professor como favorito
  Como usuario autenticado
  Para que eu priorize na listagem de turmas aquelas com meus professores favoritos
  Eu quero poder marcar um professor como favorito

  Cenário: Marcar um professor ainda não marcado pela sua página de perfil
    Dado que exista o professor de nome "João"
    E que eu esteja em sua página de perfil
    Quando eu clicar no botão de favoritar
    Então devo ver em sua página que eu marquei como favorito
    
  Cenário: Marcar um professor já marcado pela sua página de perfil
    Dado que exista o professor de nome "João"
    E que ele já esteja marcado como favorito
    E que eu esteja em sua página de perfil
    Quando eu clicar no botão de favoritar
    Então devo ver em sua página que eu desmarquei como favorito
