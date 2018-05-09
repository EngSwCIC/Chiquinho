#language: pt
#encoding: utf-8

Funcionalidade: Listar matérias do curso na página de curso
  Como usuário não autenticado
  Para que saiba quais são as matérias do meu curso e veja links para elas
  Eu quero abrir a página do meu curso e ver a lista de matérias, constando obrigatórias e optativas.

  Cenário: Ver todas as matérias ao acessar curso desejado
    Dado que eu esteja na página de cursos
    E tenha um curso criado:
    |kind        |code|name           |turn     |classification|
    |"Presencial"|701 |"ADMINISTRAÇÃO"|"Noturno"|exatas   |
    E com as matérias dele:
    |code|name  |credits          |area|
    |25  |"Algo"|"002 002 004 008"|"AC"|
    |26  |"Ogla"|"004 002 004 008"|"DC"|
    Quando eu clicar no link para detalhes daquele curso
    Então eu devo ver os dados do curso:
      |kind        |code|name           |turn     |classification|
      |"Presencial"|701 |"ADMINISTRAÇÃO"|"Noturno"|exatas   |
    E eu devo ver a lista completa das matérias deste curso:
      |code|name  |credits          |area|
      |25  |"Algo"|"002 002 004 008"|"AC"|
      |26  |"Ogla"|"004 002 004 008"|"DC"|