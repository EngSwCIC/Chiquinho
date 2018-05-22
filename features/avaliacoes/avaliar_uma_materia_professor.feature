#language: pt
#encoding: utf-8

Funcionalidade: Avaliar uma matéria de um professor por trabalhos,provas e tarefas
  Como aluno
  Para que eu avalie uma matéria de um professor quanto as dificuldades
  Eu quero poder dar uma nota de 0 a 10 quanto à trabalhos, provas e tarefas relacionadas àquela matéria com aquele professor

  Cenário: Avaliar com sucesso uma matéria com um professor
    Dado que eu tenha me cadastrado e me autenticado
    E que exita uma matéria criada com um professor
    Quando eu clicar no link para detalhes daquela matéria com aquele professor
    E clicar na estrela de avalição para 5 estrelas
    Então eu devo ver uma mensagem dizendo "Avaliação feita"
    E devo ver as 5 estrelas aparecendo para aquela avaliação