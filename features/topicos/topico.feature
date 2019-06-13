#language: pt
#encoding: utf-8

Funcionalidade: Criar um novo tópico dentro do fórum do curso
-Eu,como usário autenticado
-Quero adicionar um novo tópico ao fórum de discussão do curso
-Para que eu e outros alunos possamos comentar sobre o curso

  Cenario: Adicionar um novo tópico ao fórum
    Dado que eu tenha me cadastrado e me autenticado
    Dado que estou na página do curso de "CIÊNCIA DA COMPUTAÇÃO"
    Quando eu clicar no botão Forum
    E eu pressionar o botão Criar novo tópico
    E eu escrever no formulario:
    |title|Evasão no Curso de CiC|
    |description|CiC é um curso com muita evasão|
    E eu pressionar o botão enviar
    Então devo ir para a página de tópicos
    E enxergar o meu tópico criado
    |title|Evasão no Curso de CiC|
    |description|CiC é um curso com muita evasão|
