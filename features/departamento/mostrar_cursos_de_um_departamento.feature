#language: pt
#encoding: utf-8

Funcionalidade: mostrar_cursos_de_um_departamento
  Como Usuario não autenticado
  Para que eu possa saber dos cursos geridos pelo meu departamento
  Eu quero poder ver os cursos que meu deparatmento gere ao acessar a pagina dele

  Cenario: ver a lista de cursos de um dado departamento
    Dado que eu exista um departamento com os campos:
      |name   |AQJI                                  |
      |initial|CIC                                  |
      |code   |116                                  |
    E que eu exista um curso daquele departamento com os campos:
      |kind          |Presencial           |
      |code          |370                  |
      |name          |CIÊNCIA DA COMPUTAÇÃO|
      |turn          |Diurno               |
      |classification|exatas               |
    E que eu esteja na pagina de listagem de departamentos
    Quando eu clicar em Detalhes do respectivo departamento
    Então devo ver o nome do curso na pagina
