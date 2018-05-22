#language: pt
#encoding: utf-8

Funcionalidade: Ver um fórum de discussão do curso
  Como estudante da UnB
  Para que eu obtenha mais informações sobre um curso
  Eu quero poder ver um fórum de discussão sobre o curso

  Cenário: Usuário vê um fórum com informações sobre o curso
    Dado que eu esteja na página do curso "CIÊNCIA DA COMPUTAÇÃO"
    E que exista um link para o fórum do curso
    Quando eu clicar no link "Fórum"
    Então eu devo ver uma lista com diferentes tópicos sobre assuntos relacionados ao curso