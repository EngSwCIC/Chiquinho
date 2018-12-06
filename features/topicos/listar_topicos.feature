#language: pt
#encoding: utf-8
  #Gabriel Ribeiro

Funcionalidade: Listar todos os topicos do sistema
  Como estudante da UnB
  Para que eu possa ler tópicos postados por outros alunos
  Eu quero ver os topicos sobre materias cursos e professores de 10 em 10
  Para que eu e outros alunos possamos ver as ultimas perguntas postadas
  Cenário de Fundo:
    Dado que eu tenha me cadastrado e me autenticado
    #caso feliz
  Cenário: Usuário vê os ultimos topicos postados
    Dado que eu esteja na página de Fóruns
    E que existam os topicos criados com os campos:
      |Um titulo interessante    |desc1       |
      |Um outro titulo           |desc2       |
    E eu clicar em 'Fóruns'
    Entao eu devo ver a lista completa com os topicos
      |Um titulo interessante|
      |Um outro titulo       |
    #caso triste
  Cenário: Não existem tópicos criados
    Dado que eu esteja na página de Fóruns
    E que não existam tópicos
    E eu clicar em 'Fóruns'
    Entao eu não devo ver a lista com os topicos
      |Um titulo interessante|
      |Um outro titulo       |