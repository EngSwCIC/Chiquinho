#language: pt
#encoding: utf-8
  #Gabriel Halabi

Funcionalidade: Editar um tópico
  Como usuário autenticado
  Para que eu possa editar um tópico de minha autoria
  Eu quero alterar o conteúdo deste tópico

  Cenário: Usuário edita o conteúdo de um post de sua autoria
    Dado que eu seja um usuário autenticado
    E que exista um tópico criado por este usuário com os campos:
    |title|TITLE 1|
    |description|DESC 1|
    E que eu entre na página deste tópico
    E eu clicar no botão "Editar"
    E eu devo ver os dados:
    |description|DESC 1|
    E eu alterar os dados no formulário para:
    |description|DESC 2|
    E eu clicar no botão "Enviar"
    Então eu devo ser redirecionado para a página do tópico
    E eu devo ver os dados:
    |description|DESC 2|

  Cenário: Usuário edita o conteúdo de um post de sua autoria porém não envia a alteração
    Dado que eu seja um usuário autenticado
    E que exista um tópico criado por este usuário com os campos:
    |title|TITLE 1|
    |description|DESC 1|
    E que eu entre na página deste tópico
    E eu clicar no botão "Editar"
    E eu devo ver os dados:
    |description|DESC 1|
    E eu alterar os dados no formulário para:
    |description|DESC 2|
    Então que eu entre na página deste tópico
    E eu devo ver os dados:
    |description|DESC 1|