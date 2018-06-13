#language: pt
#encoding: utf-8

Funcionalidade: comentar sobre uma materia
  Como Usuario Autenticado
  Para que eu possa expressar minha opnião sobre uma determinada materia
  Eu quero poder comentar sobre assuntos dessa materia em geral

  Cenario: o usuario comenta sobre uma materia
    Dado que eu tenha me cadastrado previamente como "nick-nish@hotmail.com", senha "123456", matricula: "15/0019343", nome: "Nicholas", sobrenome: "Marques" e curso: "CIÊNCIA DA COMPUTAÇÃO"
    E eu me autentique no sistema
    E que eu tenha uma matéria criada com os atributos:
      |code   |116327                 |
      |name   |ORGANIZAÇÃO DE ARQUIVOS|
      |credits|002 002 000 004        |
      |area   |AC                     |
    E que eu esteja na pagina de vizualização dessa materia
    Quando eu preencher o campo de comentario com:
    |comment_content|Matéria bem interessante, aprendi bastante sobre funcionamento de hardware|
    E clicar no botão "Enviar Comentario"
    Então devo ver o meu comentario "Matéria bem interessante, aprendi bastante sobre funcionamento de hardware" na pagina de vizualização da matéria
  
  Cenario: o usuario tenta enviar um comentário com o campo vazio
    Dado que eu tenha me cadastrado previamente como "nick-nish@hotmail.com", senha "123456", matricula: "15/0019343", nome: "Nicholas", sobrenome: "Marques" e curso: "CIÊNCIA DA COMPUTAÇÃO"
    E eu me autentique no sistema
    E que eu tenha uma matéria criada com os atributos:
      |code   |116327                 |
      |name   |ORGANIZAÇÃO DE ARQUIVOS|
      |credits|002 002 000 004        |
      |area   |AC                     |
    E que eu esteja na pagina de vizualização dessa materia
    Quando eu clicar no botão "Enviar Comentario"
    Então devo ver uma mensagem de erro "Não foi possível salvar seu comentário"