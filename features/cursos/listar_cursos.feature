#language: pt
#encoding: utf-8

Funcionalidade: Listar todos os cursos do sistema
  Como estudante da UnB
  Para que eu encontre as matérias do meu curso
  Eu quero ver a lista com todos os cursos de 25 em 25

  Delineação do Cenário: Usuário vê lista completa dos cursos
    Dado que eu esteja na página inicial
    E que existam os cursos criados com os campos "<kind>",<code>,"<name>","<turn>",<classification>
    Quando eu clicar no link "Explorar Cursos"
    Entao eu devo ver a lista completa com os cursos "<kind>",<code>,"<name>","<turn>",<classification>

    Exemplos:
    |kind     |code|name         |turn  |classification|
    |Distância|19  |Administração|Diurno|0             |
    |Distância|86  |Agronomia    |Diurno|1             |