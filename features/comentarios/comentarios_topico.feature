#language: pt
#encoding: utf-8

Funcionalidade: Comentar sobre um tópico do curso
-Eu,como usário autenticado
-Quero adicionar um comentário a um tópico de discussão do curso
-Para que eu possa contribuir com minha opinião sobre o tópico em questão

#Happy Path
  Cenario: Adicionar um comentário sobre o tópico
    Dado que eu tenha me cadastrado e me autenticado
    Dado que estou na página do fórum do curso de "CIÊNCIA DA COMPUTAÇÃO"
    Quando eu clicar no botão Comentários
    E eu digitar o comentário:
    |content|Tópico muito interessante|
    E eu pressionar o botão enviar comentário
    Então devo ir para a página do tópico
    E enxergar o meu comentário com os dados:
    |content|Tópico muito interessante|

#Sad Path
  Cenario: Tentar adicionar um comentário sobre tópico sem estar logado
    Dado que estou na página do fórum do curso "CIÊNCIA DA COMPUTAÇÃO"
    Quando eu clicar no botão Comentários
    E eu digitar o comentário:
    |content|tópico não é interessante|
    E eu pressionar o botão enviar comentário
    Então devo ir para a página de login