#language: pt
#encoding: utf-8

Funcionalidade: Adicionar turma à grade horária
  Como usuário autenticado
  Para que eu estime meu semestre
  Eu quero colocar as turmas que vou fazer e ver uma estimativa de pontos do meu semestre

  Cenário: Adicionar 1 turma na minha grade e estimar créditos
    Dado que eu tenha me cadastrado e me autenticado
    E que eu tenha uma matéria criada com os atributos:
      |code   |116327                 |
      |name   |ORGANIZAÇÃO DE ARQUIVOS|
      |credits|002 002 000 004        |
      |area   |AC                     |
    E que essa matéria tenha turma "A"
    E que essa turma tenha horários:
      |dia    |horario                |
      |Terça  |8h                     |
      |Quinta |8h                     |
    E que eu esteja na pagina da matéria
    Quando eu clicar no botão "Adicionar à grade" turma "A"
    Então devo ver a nova turma adicionada a grade
    
    
  Cenário: Adicionar 1 turma na minha grade que conflite com o horário de outra já adicionada
    Dado que eu tenha adicionado uma matéria na minha grade
    E que eu tenha uma matéria criada com os atributos:
      |code   |116441                 |
      |name   |ENGENHARIA DE SOFTWARE |
      |credits|004 000 000 004        |
      |area   |AC                     |
    E que essa matéria tenha turma "A"
    E que essa turma tenha horários:
      |dia    |horario                |
      |Terça  |8h                     |
      |Quinta |8h                     |
    E que eu esteja na pagina da matéria
    Quando eu clicar no botão "Adicionar à grade" turma "A"
    Então eu devo ver uma mensagem de erro "Conflito de horário"
    
  Cenário: Adicionar 1 turma cuja matéria já foi adicionada na minha grade
    Dado que eu tenha adicionado uma matéria na minha grade
    E que essa matéria tenha turma "B"
    E que essa turma tenha horários:
      |dia    |horario                |
      |Segunda|10h                    |
      |Sexta  |10h                    |
    Quando eu clicar no botão "Adicionar à grade" turma "B"
    Então eu devo ver uma mensagem de erro "Matéria já adicionada à grade"
    
    
