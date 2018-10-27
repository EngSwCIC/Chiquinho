#language: pt
#encoding: utf-8

Funcionalidade: ver_sala_professor
  Como usuario do sistema.
  Para que eu possa encontrar um professor especifico.
  Eu quero ver a sala do professor ao acessar uma pagina do perfil do professor selecionado.

  Delineacao do Cenario: Cenario: ver local da sala do professor
    Dado que existam professores com campos "<name>" e "<local>"
    E que esteja na pagina de listagem de professores
    Quando eu clicar no link de detalhes do professor "<name>"
    Então devo ir pra uma pagina com detalhes sobre o professor "<name>" com a sala "<local>"

    Exemplos:
      |name              |local           |
      |Alexandre Zaghetto|CIC/EST A1-45-07|
      |Bruno Macchiavello|CIC/EST A1-45-07|
      |Marcelo Ladeira   |CIC/EST A1-16-28|
      |Edison Ishikawa   |CIC/EST A1-15-28|
