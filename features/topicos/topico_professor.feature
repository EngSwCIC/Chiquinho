#language: pt
#encoding: utf-8
  #Caio Albuquerque

Funcionalidade: Criar um tópico dentro do fórum de discussão do professor
  Como estudante da UnB
  Para que eu possa comentar sobre assuntos de um professor
  Eu quero poder abrir um tópico de discussão do professor
  Para que eu e outros alunos possamos comentar sobre o professor
  Cenário de Fundo:
    Dado que eu tenha me cadastrado e me autenticado
  Cenário: Usuário abre um tópico de discussão do professor
    Dado que eu esteja na página do professor "GENAINA NUNES RODRIGUES"
    Quando eu clicar no link "Forum do professor"
    E eu clicar no link 'Criar novo tópico'
    E preencher o fórmulário com:
    |title|GENA|
    |description|Muito interessante a matéria abordado pela professora|
    E clicar no botão "Enviar"
    Então eu devo ser redirecionado para a página de tópicos
    E ver os dados:
    |title|GENA|

  Cenário: Usuário abre um tópico de discussão vazio no fórum do curso
    Dado que eu esteja na página do professor "GENAINA NUNES RODRIGUES"
    Quando eu clicar no link "Forum do professor"
    E eu clicar no link 'Criar novo tópico'
    Então eu devo ser redirecionado para a página de cadastro
