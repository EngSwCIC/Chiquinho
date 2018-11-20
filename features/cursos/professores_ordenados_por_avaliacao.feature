#language: pt
#encoding: utf-8

Funcionalidade: Ver professores do curso ordenados por avaliação
  Como usuário não autenticado
  
  Cenário:
  Dado que exista o departamento "CIC" com professores:
  | nome  |
  | João  | 
  | Maria |
  E que os professores tenham avaliação nas matérias:
  | professor | matéria | trabalhos | provas | tarefas |
  | João      | APC     | 10        | 5      | 8       |
  | Maria     | APC     | 10        | 10     | 10      |
  | Maria     | ED      | 10        | 10     | 10      |
  | João      | APC     | 10        | 7      | 9       |
  Dado que exista o departamento "MAT" com professores:
  | nome    |
  | Carla   |
  | Eduardo |
  E dado que exista o curso "Engenharia de Computação" do "CIC"
  E que eu esteja na página do curso
  Quando clicar para ver professores do curso
  Então devo ver os professores do "CIC"
  E não devo ver os professores do "MAT"
  E devo ver "Maria" na frente da "João"
