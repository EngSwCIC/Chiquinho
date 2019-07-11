#language: pt
#encoding: utf-8

Funcionalidade: Responder sobre um comentário do curso
-Eu,como usário autenticado, ou não
-Quero adicionar uma resposta a um comentário de discussão do topico
-Para que eu possa contribuir com minha opinião sobre o comentário em questão

#Happy Path
  Cenario: Adicionar uma resposta sobre um comentário
    Dado que eu tenha me cadastrado e me autenticado
    Dado que estou na página do fórum do curso de "CIÊNCIA DA COMPUTAÇÃO"
    Quando eu clicar no botão de Comentários
    E eu clicar no botão de Respostas
    E eu digitar a resposta:
    |content|Comentário muito interessante|
    E eu pressionar o botão enviar resposta
    Então devo permanecer na pagina de respostas 
    E enxergar a minha resposta com os dados:
    |content|Comentário muito interessante|

#Sad Path
  Cenario: Adicionar uma resposta em um comentário sem estar logado
    Dado que estou na página do fórum do curso "CIÊNCIA DA COMPUTAÇÃO"
    E exista um comentário criado
    Quando eu clicar no botão Comentários
    E eu clicar no botão de Respostas
    E eu digitar a resposta:
    |content|Comentário não é interessante|
    E eu pressionar o botão enviar resposta
    Então devo ir para a página de login
