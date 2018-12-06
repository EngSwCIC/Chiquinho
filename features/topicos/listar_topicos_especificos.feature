#language: pt
#encoding: utf-8

Funcionalidade: Listar topicos especificos de um professor curso ou materia
  Como estudante da UnB
  Para que eu possa ler tópicos postados por outros alunos sobre um professor curso ou materia
  Eu quero ver os topicos sobre materias cursos ou professores de 10 em 10
  Para que eu e outros alunos possamos ver as ultimas perguntas postadas sobre essas categorias
  Cenário de Fundo:
    Dado que eu esteja logado
  Cenario: Ver os topicos criados sobre um professor
    Dado que exista um professor criado com os atributos:
      |name|João|
    E que exista para esse professor o topico:
      |title|Quantas materias|
      |description|Este professor ministra?|
    E que eu esteja na pagina desse professor
    Quando eu clicar no link "Forum do professor"
    Entao eu devo ver o topico desse professor:
      |Quantas materias|

  Cenario: Ver os topicos criados sobre uma materia
    Dado que exista uma materia criada com os atributos:
      |code|116327|
      |name|ORGANIZAÇÃO DE ARQUIVOS|
      |credits|002 002 000 004|
      |area|AC|
    E que exista para essa materia o topico:
      |title|Quantos creditos|
      |description|Tem esta materia?|
    E que eu esteja na pagina dessa materia
    Quando eu clicar no link "Forum da materia"
    Entao eu devo ver o topico dessa materia:
      |Quantos creditos|

  Cenario: Ver os topicos criados sobre um curso
    Dado que exista um curso criado com os atributos:
      |kind|"Presencial"|
      |code|701|
      |name|ADMINISTRAÇÃO|
      |turn|"Noturno"|
      |classification|exatas|
    E que exista para esse curso o topico:
      |title|Em quantos semestres|
      |description|Este curso termina?|
    E que eu esteja na pagina desse curso
    Quando eu clicar no link "Forum do curso"
    Entao eu devo ver o topico desse curso:
      |Em quantos semestres|