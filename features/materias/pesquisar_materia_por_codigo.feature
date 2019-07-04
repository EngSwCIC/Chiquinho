#language: pt
#encoding: utf-8

Funcionalidade: Filtrar matérias por código
-Como usuário não autenticado
-Quero pesquisar uma matéria por código  

  Cenario: Pesquisar matéria por código
   Dado que eu esteja na página inicial
   Quando eu clicar no botao de filtro
   E eu prencher com o código:
   |code|133230|
   E eu apertar o botão pesquisar
   Então devo ser redirecionado para a pagina materias
   E verificar que as materias estao filtradas pelo código