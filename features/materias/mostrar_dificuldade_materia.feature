#language: pt
#encoding: utf-8

Funcionalidade: Mostrar a dificuldade da mateŕia
  Como aluno da UnB
  Para que eu tenha uma ideia da dificuldade de uma matéria
  Eu quero poder ver dados de 0 a 10 quanto a dificuldade de uma matéria por trabalhos,
  tarefas e provas baseado em avaliações de outros alunos

  Cenário: Acessar página de matérias com avaliações previamente feitas
    Dado que exista uma matéria criada com um professor
    E que ela tenha sido avaliada com provas 5, trabalhos 7 e tarefas 10
    Quando eu acessar a página daquela matéria
    Então eu devo ver gráficos com o valores provas 5, trabalhos 7 e tarefas 10