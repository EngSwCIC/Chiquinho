#language: pt
#encoding: utf-8

Funcionalidade: mostrar_professores_do_departamento
  Como Usuario não autenticado
  Para que eu possa ter conhecimento dos professores do meu departamento
  Eu quero poder ver uma lista desses professores na pagina do meu departamento

  Cenario: ver a lista de professores de um dado departamento
    Dado que eu exista um departamento com os campos:
      |name   |DEPARTAMENTO DE CIÊNCIA DA COMPUTAÇÃO|
      |initial|CIC                                  |
      |code   |116                                  |
    E que eu exista um professor daquele departamento com os campos:
      |name|joao|
    E que eu esteja na pagina de listagem de departamentos
    Quando eu clicar em Detalhes do respectivo departamento
    Então devo ver o nome do professor na pagina




























