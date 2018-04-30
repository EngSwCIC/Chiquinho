#language: pt
#encoding: utf-8

Funcionalidade: Criação da Tela de Perfil
  Como usuário autenticado
  Para que eu tenha uma estimativa de dificuldade das matérias que estou fazendo
  Eu quero ver meu perfil com as matérias que pretendo fazer no semestre

  Cenário: Acesso à tela de perfil com conteúdos do usuário
    Dado que eu tenha me cadastrado previamente como "nick-nish@hotmail.com", senha "123456", matricula: "15/0019343", nome: "Nicholas", sobrenome: "Marques" e curso: "CIÊNCIA DA COMPUTAÇÃO"
    E eu me autentique no sistema
    E que eu esteja na página inicial
    Quando eu clicar no link "Perfil"
    Então eu devo ver campos para edição do meu perfil:
    |first_name|Nome|
    |last_name |Sobrenome|
    |matricula |Matrícula|
    |course_id |Curso    |
    E uma mini-grade horária com matérias que estou fazendo-desejo fazer