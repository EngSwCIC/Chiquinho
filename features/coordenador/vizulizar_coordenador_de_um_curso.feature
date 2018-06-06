#language: pt
#encoding: utf-8

Funcionalidade: vizulizar_orientador_de_um_curso
  Como Usuario não autenticado
  Para que eu possa saber qual é o orientador do meu
  Eu quero poder visualiza-la na pagina do meu curso

  Cenario: Visualizar o orientador do meu curso na pagina do mesmo
    Dado que exista o curso com os campos:
      |kind          |presencial   |
      |code          |19           |
      |name          |ADMINISTRAÇÃO|
      |turn          |Diurno       |
      |classification|humanas      |
      |opcode        |8117         |
    E que exista um professor que seja o orientador desse curso com os campos:
      |name|Marcos|
    E que eu esteja na pagina de vizualização desse curso
    Então devo um card com o nome do orientador
