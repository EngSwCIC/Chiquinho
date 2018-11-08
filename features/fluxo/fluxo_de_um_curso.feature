#language: pt
#encoding: utf-8

Funcionalidade: fluxo_de_um_curso
  Como usuário autenticado ou não
  Para que eu vislumbre o conteudo abordado pelo curso
  Eu quero visualizar o fluxo do curso em questão

  Contexto:
    Dado que eu estou na página do curso "ENGENHARIA DE COMPUTAÇÃO"
    E que tenha as seguintes matérias:
      |code  |name                                     |credits        |area|semester|
      |113476|ALGORITMOS E PROGRAMAÇÃO DE COMPUTADORES |004 002 000 006|AC  |1       |
      |116394|ORGANIZAÇÃO E ARQUITETURA DE COMPUTADORES|004 000 000 004|AC  |5       |
      |116441|ENGENHARIA DE SOFTWARE                   |004 000 000 004|AC  |6       |
      |113034|CÁLCULO 1                                |002 004 000 006|DC  |1       |

  Cenário: Visualizar o fluxo do primeiro semestre de um curso
    Quando eu clicar no link de url "#semester-1"
    Então eu devo ver as seguintes matérias:
      |code  |name                                     |credits        |area|
      |113476|ALGORITMOS E PROGRAMAÇÃO DE COMPUTADORES |004 002 000 006|AC  |
      |113034|CÁLCULO 1                                |002 004 000 006|DC  |

  Cenário: Visualizar o fluxo do quinto semestre de um curso
    Quando eu clicar no link de url "#semester-5"
    Então eu devo ver as seguintes matérias:
      |code  |name                                     |credits        |area|
      |116394|ORGANIZAÇÃO E ARQUITETURA DE COMPUTADORES|004 000 000 004|AC  |

  Cenário: Visualizar o fluxo do sexto semestre de um curso
    Quando eu clicar no link de url "#semester-6"
    Então eu devo ver as seguintes matérias:
      |code  |name                                     |credits        |area|
      |116441|ENGENHARIA DE SOFTWARE                   |004 000 000 004|AC  |
