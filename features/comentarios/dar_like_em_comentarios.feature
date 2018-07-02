#language: pt
#encoding: utf-8

Funcionalidade: dar_like_em_comentarios
  Como usuario autenticado
  Para que eu possa demonstrar que eu gosto de algum comentario
  Eu quero poder dar like em um comentario

  Cenario:
    Dado que eu tenha me cadastrado previamente como "nick-nish@hotmail.com", senha "123456", matricula: "15/0019343", nome: "Nicholas", sobrenome: "Marques" e curso: "CIÊNCIA DA COMPUTAÇÃO"
    E eu me autentique no sistema
    E que exista um profesor com os campos:
      |name|Joao|
    E que esse professor ministre uma materia com os campos:
      |code   |116327                 |
      |name   |ORGANIZAÇÃO DE ARQUIVOS|
      |credits|002 002 000 004        |
      |area   |AC                     |
    E que exista um comentario da materia ministrada por esse professor com os campos:
      |content|otima materia, excelente professor|
    E que eu esteja na pagina de vizualização da materia ministrada por esse professor
    Quando eu clicar no botão de like
    Então quero ver o numero de likes ser igual a um
