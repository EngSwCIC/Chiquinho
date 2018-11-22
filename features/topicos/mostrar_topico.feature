#language: pt
#encoding: utf-8

Funcionalidade: Mostrar um tópico específico
  Como estudante da UnB
  Para que eu possa ler um tópico de um aluno
  Eu quero ver o conteúdo deste tópico bem como suas respostas

  Cenário: Usuário vê o conteúdo de um post e suas respostas
    Dado que exista um usuário
    E que exista um tópico criado por este usuário com os campos:
    |title|Um título interessante|
    |description|Uma longa e tediosa descrição|
    E que exista uma resposta com os campos:
    |title|Nada para ver aqui|
    |description|Uma resposta curta|
    E que eu entre na página deste tópico
    Então eu devo ver os dados:
    |description|Uma longa e tediosa descrição|
    |response|Uma resposta curta|