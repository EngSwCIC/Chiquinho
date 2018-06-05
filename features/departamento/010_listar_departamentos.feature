#language: pt
#encoding: utf-8

Funcionalidade: 010_listar_departamentos
  Como Usuario não autenticado
  Para que eu possa ter acesso aos departamentos da unb
  Eu quero poder ver uma lista com todos esses departamentos

    Delineacao do Cenario: Ver a lista com os departamentos da UnB
    Dado que eu esteja na pagina inicial
    E que existam departamentos com campos "<name>", "<initial>", "<code>"
    Quando eu clicar no link "Departamentos"
    Então Devo ver uma lista dos departamentos com os campos "<name>", "<initial>", "<code>"
      Exemplos:
      |name                                 |initial|code|
      |DEPARTAMENTO DE CIÊNCIA DA COMPUTAÇÃO|CIC     |116 |
      |CENTRO DE DESENVOLVIMENTO SUSTENTÁVEL|CDS     |383 |
      |DEPARTAMENTO DE ANTROPOLOGIA         |DAN     |135 |
