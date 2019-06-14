
#language: pt
#encoding: utf-8

Funcionalidade: Remover um tópico criado por mim
-Eu,como usário autenticado
-Quero remover um tópico criado por mim no fórum de discussão do curso

  Cenario: Remover um tópico do fórum
    Dado que eu tenha me cadastrado e me autenticado
    E que estou na página do curso de "CIÊNCIA DA COMPUTAÇÃO"
    E que eu tenha criado o tópico "Tópico 1"    
    Quando eu clicar no botão de Forum
    E eu clicar no botão de remover em um tópico criado por mim
    Então o tópico deverá ser removido
    E eu serei redirecionado para a página do fórum do curso