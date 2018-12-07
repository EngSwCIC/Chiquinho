#language: pt
#encoding: utf-8

Funcionalidade: Ver nome da sala do professor
  Como usuario do sistema.
  Para que eu possa encontrar um professor especifico.
  Eu quero ver a sala do professor ao acessar uma pagina do perfil do professor selecionado.

  Delineação do Cenário: Professor com informação de sala.
    Dado que existam professores com campos "<name>" e "<local>"
    E que esteja na pagina de listagem de professores
    Quando eu clicar no link de detalhes do professor "<name>"
    Então devo ir pra uma pagina com detalhes sobre o professor "<name>"
    E devo ver que a sala do professor é "<local>"

    Exemplos:
      |name              |local           |
      |Alexandre Zaghetto|CIC/EST A1-45-07|
      |Bruno Macchiavello|CIC/EST A1-45-07|
      |Marcelo Ladeira   |CIC/EST A1-16-28|
      |Edison Ishikawa   |CIC/EST A1-15-28|

  Delineação do Cenário: Professor sem informação de sala.
    Dado que existam professores com campos "<name>" sem o campo sala
    E que esteja na pagina de listagem de professores
    Quando eu clicar no link de detalhes do professor "<name>"
    Então devo ir pra uma pagina com detalhes sobre o professor "<name>"
    E devo ver que a sala do professor não está disponível

    Exemplos:
      |name              |
      |Alexandre Zaghetto|
      |Bruno Macchiavello|
      |Marcelo Ladeira   |
