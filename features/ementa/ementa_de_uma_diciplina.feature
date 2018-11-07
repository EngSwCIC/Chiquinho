#language: pt
#encoding: utf-8

Funcionalidade: ementa_de_uma_diciplina
  Como usuário autendicado ou não
  Para que eu vislumbre o conteudo abordado pela matéria
  Eu quero visualizar a ementa da matéria em questão

  Cenário: Visualizar a ementa de uma matéria
    Dado que eu tenha uma matéria criada com os atributos:
      |code   |116327                 |
      |name   |ORGANIZAÇÃO DE ARQUIVOS|
      |credits|002 002 000 004        |
      |area   |AC                     |
    E que tenha ementa: "Ementa da matéria..."
    E que eu estou na página dessa matéria
    Então devo ver a ementa da matéria
