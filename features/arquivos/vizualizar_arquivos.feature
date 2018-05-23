#language: pt
#encoding: utf-8

Funcionalidade: vizualizar_arquivos
 # Como usuario autenticado
  #Para que eu possa ter acesso a materiais de estudo de uma materia com um professor
  #Eu quero poder acesso ao arqivos compartilhados por outros usuarios do sistema

  #Delineação do Cenário: Cenario: ver lista de arquivos
   #Dado que eu tenha uma matéria criada com os atributos:
    #  |code   |116327                 |
     # |name   |ORGANIZAÇÃO DE ARQUIVOS|
      #|credits|002 002 000 004        |
      #|area   |AC                     |
    #E que ela é ministrada por um professor criado com os atributos:
     # |name|João|
    #E existam materiais de estudo "<name>" postados por um usuario com os atributos:
     # |user_email|nicknish@hotmail.com     |
      #|user_matricula |150019343           |
   #   |user_first_name      |Nicholas      |
    #  |user_last_name       |Marques       |
     # |user_password  |123456              |
      #|user_password_confirmation|123456   |
#    E que eu esteja na pagina de vizualização dessa materia
 #   Quando eu clicar no link "Materiais de Estudo"
  #  Então ver uma lista com esses arquivos "<name>"
   # Exemplos:
    #  |name      |
     # |lista1.pdf|
      #|lista2.pdf|
      #|lista3.pdf|