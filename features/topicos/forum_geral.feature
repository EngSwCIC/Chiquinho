#language: pt
#encoding: utf-8

Funcionalidade: Visitar o fórum geral matérias
-Quero vizualizar o fórum geral do curso
-Para que eu possa vizualizar todos os tópicos criados

  Cenario: Visualizar o fórum geral de matérias
    Dado que eu esteja na página principal
    Quando eu clicar no submenu Fórum
    Então eu devo ser redirecionado para página do fórum geral
    E enxergar os tópicos criados:
    |title|Tópico de Engenharia de Software|
    |course|Engenharia|
