#language: pt
#encoding: utf-8

Funcionalidade: mostrar_detalhes_do_departamento
  Como Usuario não autenticado
  Para que eu possa acessar os dados de um curso especifico
  Eu quero poder ver os detalhes de um determinado teste

  Cenario: mostar detalhes de um teste
    Dado que eu exista um departamento com os campos:
      |name   |DEPARTAMENTO DE CIÊNCIA DA COMPUTAÇÃO|
      |initial|CIC                                  |
      |code   |116                                  |
    E que eu esteja na pagina de listagem de departamentos
    Quando eu clicar no link "Detalhes"
    Então devo ver uma pagina do departamento com os dados:
      |name   |DEPARTAMENTO DE CIÊNCIA DA COMPUTAÇÃO|
      |initial|CIC                                  |
      |code   |116                                  |
