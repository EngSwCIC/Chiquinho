#language: pt
#encoding: utf-8

Funcionalidade: ver_professores_do_meu_curso
  Como Usuario não autenticado
  Para que eu possa ter acesso ao meus professores do curso
  Eu quero poder ter acesso a uma pagina que lista esses professores

  Cenario: Ver uma lista de professores de um determinado curso
    Dado que eu exista um departamento com os campos:
      |name   |AQJI                                 |
      |initial|CIC                                  |
      |code   |116                                  |
    E que eu exista um curso daquele departamento com os campos:
      |kind          |Presencial           |
      |code          |370                  |
      |name          |CIÊNCIA DA COMPUTAÇÃO|
      |turn          |Diurno               |
      |classification|exatas               |
    E que eu exista um professor daquele departamento com os campos:
      |name|joao|
    E que exista um coordenador do curso com os campos:
      |name|jose|
    E que eu esteja na pagina de vizualização desse curso
    Quando eu clicar no link "Ver Professores do Curso"
    Então devo uma lista com os professores desse curso


