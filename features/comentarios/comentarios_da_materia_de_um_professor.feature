#language: pt
#encoding: utf-8

Funcionalidade: comentar sobre uma materia ministrada por um professor
  Como Usuario Autenticado
  Para que eu possa expressar minha opnião sobre um professor sobre uma determinada materia
  Eu quero poder comentar sobre esse professor em relação à essa materia

  Cenario: o usuario comenta sobre uma materia ministrada por um professor
    Dado que eu tenha me cadastrado previamente como "nick-nish@hotmail.com", senha "123456", matricula: "15/0019343", nome: "Nicholas", sobrenome: "Marques" e curso: "CIÊNCIA DA COMPUTAÇÃO"
    E eu me autentique no sistema
    E que eu tenha uma matéria criada com os atributos:
      |code   |116327                 |
      |name   |ORGANIZAÇÃO DE ARQUIVOS|
      |credits|002 002 000 004        |
      |area   |AC                     |
    E que ela é ministrada por um professor criado com os atributos:
      |name|João|
    E que eu esteja na pagina de vizualização dessa materia
    E eu clicar no link "Avaliar" do professor "João"
    Quando eu preencher o campo de comentario com:
    |comment_content|profesoor muito bom!!!! sabe explicar de maneira coesa e interessante o conteudo|
    E clicar no botão "Enviar Comentario"
    Então devo ver o meu comentario "profesoor muito bom!!!! sabe explicar de maneira coesa e interessante o conteudo" na pagina de vizualização da matéria
