#language: pt
#encoding: utf-8
  #Caio Albuquerque

Funcionalidade: Criar um tópico dentro do fórum de discussão do curso
  Como estudante da UnB
  Para que eu possa comentar sobre assuntos do curso
  Eu quero poder abrir um tópico de discussão no fórum
  Para que eu e outros alunos possamos comentar sobre o curso
  Cenário: Usuário abre um tópico de discussão no fórum do curso
    Dado que eu tenha me cadastrado e me autenticado
    E que eu esteja no fórum do curso de "CIÊNCIA DA COMPUTAÇÃO"
    Quando eu clicar no link "Forum"
    E eu clicar no link 'Criar novo tópico'
    E preencher o fórmulário com:
    |title|ES|
    |description|Muito interessante o assunto abordado na matéria|
    E clicar no botão "Enviar"
    Dado que eu esteja na página de Fóruns
    Então eu devo ver os dados:
    |title|ES|

  Cenário: Usuário abre um tópico de discussão vazio no fórum do curso
    Dado que eu esteja no fórum do curso de "CIÊNCIA DA COMPUTAÇÃO"
    Quando eu clicar no link "Forum"
    E eu clicar no link 'Criar novo tópico'
    Então eu devo ser redirecionado para a página de cadastro

