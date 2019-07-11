#language: pt
#encoding: utf-8

Funcionalidade: Filtrar matérias
-Como usuário não autenticado
-Quero pesquisar todas as matérias que um professor leciona 

  @professor
  Cenario: Pesquisar matérias por nome de professor
   Dado que eu esteja na página inicial
   Quando eu clicar no botao de filtro
   E eu prencher com o nome de professor:
   |professor|Joao|
   E eu apertar o botão pesquisar
   Então devo ser redirecionado para a pagina materias
   E verificar que as materias estao filtradas pelo professor

  @codigo
  Cenario: Pesquisar materia por codigo
   Dado que eu esteja na página inicial
   Quando eu clicar no botao de filtro
   E eu prencher com o codigo da materia:
   |codigo|116327|
   E eu apertar o botão pesquisar
   Então devo ser redirecionado para a pagina materias
   E verificar que as materias estao filtradas pelo codigo
  
  @area
  Cenario: Pesquisar materia por area
   Dado que eu esteja na página inicial
   Quando eu clicar no botao de filtro
   E eu prencher com a area da materia:
   |area|AC|
   E eu apertar o botão pesquisar
   Então devo ser redirecionado para a pagina materias
   E verificar que as materias estao filtradas pela area

  @creditos
  Cenario: Pesquisar materia por creditos
   Dado que eu esteja na página inicial
   Quando eu clicar no botao de filtro
   E eu prencher com o numero de creditos da materia:
   |creditos|4|
   E eu apertar o botão pesquisar
   Então devo ser redirecionado para a pagina materias
   E verificar que as materias estao filtradas pelo numero de creditos