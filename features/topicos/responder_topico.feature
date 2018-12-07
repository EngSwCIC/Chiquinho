#language: pt
#encoding: utf-8

Funcionalidade: Responder a um tópico
  Como usuário autenticado
  Para que eu possa responder a um tópico
  Eu quero poder criar um post de resposta associado a este tópico

  #happy scenario
  Cenário: Usuário responde a um tópico ja existente
    Dado que eu seja um usuário autenticado
    E que exista um tópico criado por este usuário com os campos:
    |title|TITLE 1|
    |description|DESC 1|
    E que eu entre na página deste tópico
    E eu clicar no botão "Responder"
    E eu alterar os dados no formulário para:
    |description|DESC 2|
    E eu clicar no botão "Enviar"
    Então eu devo ser redirecionado para a página do tópico
    E eu devo ver os dados:
    |description|DESC 1|
    |description|DESC 2|

  #sad scenario
  Cenário: Usuário responde a um tópico ja deletado
    Dado que eu seja um usuário autenticado
    E que exista um tópico criado por este usuário com os campos:
    |title|TITLE 1|
    |description|DESC 1|
    E eu clicar no botão "Logout"
    E que eu entre na página deste tópico
    E eu clicar no botão "Responder"
    Então eu devo ver a mensagem "Para continuar, efetue login ou registre-se."