#language: pt
#encoding: utf-8

Funcionalidade: Apagar comentário feito
-Eu,como usário autenticado, ou não
-Quero apagar um comentário feito por mim sobre um tópico de discussão do curso

#Caminho feliz
  Cenario: Apagar um comentário sobre o tópico
    Dado que eu tenha me cadastrado e me autenticado
    E que estou na página do fórum do curso de "CIÊNCIA DA COMPUTAÇÃO"
    E que eu tenha criado o comentário
    Quando eu clicar no botão Comentários
    E eu clicar no botão de remover comentário
    Então Na pagina do topico o comentário deve ser removido

#Caminho triste
  Cenario: Apagar um comentário sem estar logado
    Dado que estou na página do fórum do curso "CIÊNCIA DA COMPUTAÇÃO"
    E exista um comentário criado
    Quando eu clicar no botão Comentários
    Então devo ir para a página do tópico
    E não enxergar nenhum botão de deletar
