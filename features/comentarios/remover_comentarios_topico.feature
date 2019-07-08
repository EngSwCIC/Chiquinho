#language: pt
#encoding: utf-8

Funcionalidade: Apagar comentário feito
-Eu,como usário autenticado, ou não
-Quero apagar um comentário feito por mim sobre um tópico de discussão do curso

#Happy Path
  Cenario: Apagar um comentário sobre o tópico
    Dado que eu tenha me cadastrado e me autenticado
    E que estou na página do fórum do curso de "CIÊNCIA DA COMPUTAÇÃO"
    E que eu tenha criado o comentário
    Quando eu clicar no botão Comentários
    E eu clicar no botão de remover comentário
    Então o comentário deve ser removido
    E devo ir para a página do tópico atual
