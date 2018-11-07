#language: pt
#encoding: utf-8

Funcionalidade: Criar um tópico dentro do fórum de discussão da matéria
  Como estudante da UnB
  Para que eu possa comentar sobre assuntos de uma matéria
  Eu quero poder abrir um tópico de discussão na matéria
  Para que eu e outros alunos possamos comentar sobre a matéria

  Cenário: Usuário abre um tópico de discussão na matéria
    Dado que eu esteja na página matéria "ENGENHARIA DE SOFTWARE"
    Quando eu clicar no link "Forum"
    E eu clicar no link 'Criar novo tópico'
    E preencher o fórmulário com:
    |title|ES|
    |description|Muito interessante a matéria abordado no assunto|
    E clicar no botão "Enviar"
    Então eu devo ser redirecionado para a página de tópicos
    E ver os dados:
    |title|ES|
    |description|Muito interessante a matéria abordado no assunto|

