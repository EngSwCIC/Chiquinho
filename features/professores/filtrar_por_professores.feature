#language: pt
#encoding: utf-8

Funcionalidade: Filtrar matérias por professor
-Como usuário não autenticado
-Quero pesquisar todas as matérias que um professor leciona 

  Cenario: Pesquisar matérias por nome de professor
   Dado que eu esteja na página inicial
   Quando eu clicar no botao de filtro
   E eu prencher com o nome de professor:
   |name|Joao|
   E eu apertar o botão pesquisar
   Então devo ser redirecionado para a pagina materias
   E verificar que as materias estao filtradas pelo professor