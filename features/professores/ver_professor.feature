#language: pt
#encoding: utf-8

Funcionalidade: ver_professor
  Como usuario do sistema.
  Para que eu obtenha mais detalhes sobre um professor especifico.
  Eu quero poder acessar uma pagina do perfil do professor selecionado.

  Delineacao do Cenario: Cenario: acessar a pagina de perfil de um professor.
    Dado que existam professores com campos "<name>"
    E que esteja na pagina de listagem de professores
    Quando eu clicar no link de detalhes do professor "<name>"
    Então devo ir pra uma pagina com detalhes sobre o professor "<name>"

    Exemplos:
      |name         |
      |Maria Amelia |
      |João Lima    |
      |Bruno Marques|