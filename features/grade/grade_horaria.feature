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
    E que eu esteja na pagina de grade horária
    Quando eu clicar na coluna para adicionar um matéria
    E preencher o formulário de pesquisa com:
      |materia-search|ORGANIZAÇÃO DE ARQUIVOS|
    E clicar no botão "Adicionar"
    Então eu devo ver a nova matéria adicionada a grade "ORGANIZAÇÃO DE ARQUIVOS"
    E devo ver a quantidade de 4 créditos e "002 002 000 004"

  Cenário: Adicionar 1 matéria e ver gráficos de dificuldade
    Dado que eu tenha adicionado uma matéria a minha grade
    Então eu devo ver gráficos com o valores provas 5, trabalhos 5 e tarefas 5


  Cenário: Tentar adicionar uma matéria que não consta no banco
    Dado que eu tenha me cadastrado e me autenticado
    E que eu esteja na pagina de grade horária
    Quando eu clicar na coluna para adicionar um matéria
    E preencher o formulário de pesquisa com:
      |materia-search|Matéria que não existe|
    E clicar no botão "Adicionar"
    Então devo ver uma mensagem de erro "Matéria não encontrada."