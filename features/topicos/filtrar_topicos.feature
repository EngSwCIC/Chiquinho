#language: pt
#encoding: utf-8

Funcionalidade: Filtrar a página de tópico por campo
  Como usuário do sistema Chiquinho
  Para que eu possa melhor visualizar os tópicos discutidos por assuno
  Eu quero poder filrar os tópicos de discussão por campo
  Para que eu e outros usuários possamos acessar mais facilmente os tópicos
  Cenário de Fundo:
    Dado que eu tenha me cadastrado e me autenticado
  Cenário: Usuário filtra um tópico de discussão
    Dado que eu esteja na página de Fóruns
    E eu selecionar o professor 'GENAINA NUNES RODRIGUES'
    E eu selecionar o curso 'ADMINISTRAÇÃO'
    E eu selecionar a matéria 'ENGENHARIA DE SOFTWARE'
    E eu clicar no botão 'Filtrar'
    E eu clicar no link 'Criar novo tópico'
    E preencher o fórmulário com:
    |title|ES|
    |description|Muito interessante a matéria abordado no assunto|
    E clicar no botão 'Enviar'
    E que eu esteja na página de Fóruns
    E eu selecionar o professor 'GENAINA NUNES RODRIGUES'
    E eu selecionar o curso 'ADMINISTRAÇÃO'
    E eu selecionar a matéria 'ENGENHARIA DE SOFTWARE'
    E eu clicar no botão 'Filtrar'
    Então eu devo ser redirecionado para a página de tópicos
    E ver os dados:
      |title|ES|

  Cenário: Usuário filtra um tópico e não encontra matéria
    Dado que eu esteja na página de Fóruns
    E eu selecionar o professor 'GENAINA NUNES RODRIGUES'
    E eu selecionar o curso 'COMPUTAÇÃO'
    E eu selecionar a matéria 'ENGENHARIA DE SOFTWARE'
    E eu clicar no botão 'Filtrar'
    E eu clicar no link 'Criar novo tópico'
    E preencher o fórmulário com:
      |title|void|
      |description|void description|
    E clicar no botão 'Enviar'
    E que eu esteja na página de Fóruns
    E eu selecionar o professor 'GENAINA NUNES RODRIGUES'
    E eu selecionar o curso 'ADMINISTRAÇÃO'
    E eu selecionar a matéria 'ENGENHARIA DE SOFTWARE'
    E eu clicar no botão 'Filtrar'
    Então eu devo ser redirecionado para a página de tópicos
    E não devo ver os dados:
      |title|void|