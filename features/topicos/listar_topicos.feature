#language: pt
#encoding: utf-8

Funcionalidade: Listar todos os topicos do sistema
  Como estudante da UnB
  Para que eu possa ler tópicos postados por outros alunos
  Eu quero ver os topicos sobre materias cursos e professores de 10 em 10
  Para que eu e outros alunos possamos ver as ultimas perguntas postadas

  Delineação do Cenário: Usuário vê os ultimos topicos postados
    Dado que eu esteja na página inicial
    E que existam os topicos criados com os campos "<title>", "<description>"
    Quando eu clicar no link "Fóruns"
    Entao eu devo ver a lista completa com os topicos "<title>"

    Exemplos:
    |title                     |description |
    |Um título interessante    |desc1       |
    |Um outro titulo           |desc2       |