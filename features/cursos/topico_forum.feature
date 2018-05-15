#language: pt
#encoding: utf-8

Funcionalidade: Criar um tópico dentro do fórum de discussão do curso
  Como estudante da UnB
  Para que eu possa comentar sobre assuntos do curso
  Eu quero poder abrir um tópico de discussão no fórum
  Para que eu e outros alunos possamos comentar sobre o curso

  Cenário: Usuário abre um tópico de discussão no fórum do curso
    Dado que eu esteja no fórum do curso de "CIÊNCIA DA COMPUTAÇÃO"
    E que exista um botão para adicionar um novo tópico de discussão
    Quando eu clicar no link "Criar novo tópico"
    Então eu devo ver um fórmulário com dados para serem preenchidos