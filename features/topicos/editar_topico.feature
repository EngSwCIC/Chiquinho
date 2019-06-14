
#language: pt
#encoding: utf-8

Funcionalidade: Editar um tópico criado por mim
-Eu,como usário autenticado
-Quero editar um tópico criado por mim no fórum de discussão do curso

  Cenario: Editar um tópico do fórum
    Dado que eu tenha me cadastrado e me autenticado
    E que estou na página do curso de "CIÊNCIA DA COMPUTAÇÃO"
    E que eu tenha criado o tópico "Tópico 1"    
    Quando eu clicar no botão de Forum
    E eu clicar no botão de editar em um tópico criado por mim
    E preencher o formulario com os dados:
    |title|Tópico 2|
    |description|ola|
    E eu apertar o botao enviar
    Entao eu serei redirecionado para a página do fórum do curso
    E o tópico deverá ser editado:
    |title|Tópico 2|
    |description|ola|