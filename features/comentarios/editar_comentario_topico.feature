#language: pt
#encoding: utf-8

Funcionalidade: Editar comentário feito
-Eu,como usário autenticado, ou não
-Quero Editar um comentário feito por mim sobre um tópico de discussão do curso

#Happy Path
  Cenario: Editar um comentário sobre o tópico
    Dado que eu tenha me cadastrado e me autenticado
    E que estou na página do fórum do curso de "CIÊNCIA DA COMPUTAÇÃO"
    E que eu tenha criado o comentário
    Quando eu clicar no botão Comentários
    E eu clicar no botão de editar comentário
    E preencher o comentário com os dados:
    |content|Editado|
    E eu apertar o botao enviar
    Então devo ir para a página do tópico escolhido
    E o comentario deverá ser editado:
    |content|Editado|

#Sad Path
  Cenario: Editar um comentário sem estar logado
    Dado que estou na página do fórum do curso "CIÊNCIA DA COMPUTAÇÃO"
    E exista um comentário criado
    Quando eu clicar no botão Comentários
    Então devo ir para a página do tópico
    E não enxergar nenhum botão de editar
