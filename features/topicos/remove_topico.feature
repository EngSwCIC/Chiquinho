#language: pt
#encoding: utf-8

Funcionalidade: Remover logicamente um tópico dentro do fórum do sistema
  Como usuário logado no sistema
  Para que eu possa ter controle sobre meus tópicos
  Eu quero poder remover um tópico de discussão criado por mim

  Cenário: Remover tópico de discussão no fórum
    Dado que eu seja um usuário autenticado
    E que exista um tópico criado por este usuário com os campos:
    |title|TITLE 1|
    |description|DESC 1|
    E que eu entre na página deste tópico
    E eu clicar no botão "Remover"
    E eu clicar no botão "Remover"
    Então eu devo ser redirecionado para a página do tópico