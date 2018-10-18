#language: pt
#encoding: utf-8

Funcionalidade: Configurar grade horária do aluno
  Como usuário autenticado
  Para que eu estime meu semestre
  Eu quero colocar as matérias que vou fazer e ver uma estimativa de pontos do meu semestre

  Cenário: Adicionar 1 matéria na minha grade e estimar créditos
    Dado que eu tenha me cadastrado e me autenticado
    E que eu tenha uma matéria criada com os atributos:
      |code   |116327                 |
      |name   |ORGANIZAÇÃO DE ARQUIVOS|
      |credits|002 002 000 004        |
      |area   |AC                     |
    E que essa matéria tenha a turma "A"
    E que essa turma tenha os horários:
      |dia    |horario                |
      |Terça  |8h                     |
      |Quinta |8h                     |
    E que eu esteja na pagina dessa matéria
    Quando eu clicar no botão Adicionar Turma "A"
    Então eu devo ver a nova matéria adicionada a grade "ORGANIZAÇÃO DE ARQUIVOS"
    E devo ver a quantidade de 4 créditos e "002 002 000 004"
    E devo ver os horários preenchidos na minha grade:
      |dia    |horario                |
      |Terça  |8h                     |
      |Quinta |8h                     |

  Cenário: Adicionar 1 matéria e ver gráficos de dificuldade
    Dado que eu tenha me cadastrado e me autenticado
    E que eu esteja na pagina de grade horária
    Então eu devo ver gráficos de dificuldade

  Cenário: Remover 1 disciplina da grade
    Dado que eu tenha me cadastrado e me autenticado
    E que eu esteja na pagina de grade horária
    E que eu tenha a matéria na minha grade:
      |code   |116327                 |
      |name   |ORGANIZAÇÃO DE ARQUIVOS|
      |credits|002 002 000 004        |
      |area   |AC                     |
    E com a turma "A" de horário:
      |dia    |horario                |
      |Terça  |8h                     |
      |Quinta |8h                     |
    Quando eu clicar em algum dos blocos de horário:
      |dia    |horario                |
      |Terça  |8h                     |
      |Quinta |8h                     |
    Então todos os blocos dessa turma na grade devem ser removidos
    
    
  Cenário: Limpar a grade
    Dado que eu tenha me cadastrado e me autenticado
    E que eu esteja na pagina de grade horária
    Quando eu clicar em "Limpar grade"
    Então todos os blocos de horário da minha grade devem estar vazios

  Cenário: DEPRECATED: Tentar adicionar uma matéria que não consta no banco
    Dado que eu tenha me cadastrado e me autenticado
    E que eu esteja na pagina de grade horária
    Quando eu clicar na coluna para adicionar um matéria
    E preencher o formulário com:
      |materia-search|Matéria que não existe|
    E clicar no botão "Adicionar"
    Então devo ver uma mensagem de erro "Matéria não encontrada."
