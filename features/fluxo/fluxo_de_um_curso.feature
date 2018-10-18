#language: pt
#encoding: utf-8

Funcionalidade: fluxo_de_um_curso
  Como usuário autendicado ou não
  Para que eu vislumbre o conteudo abordado pelo curso
  Eu quero visualizar o fluxo do curso em questão

  Cenário: Visualizar o fluxo de uma curso
    Dado que eu estou na página do curso "CIÊNCIA DA COMPUTAÇÃO"
    Quando eu clicar no botão "Ver Fluxo"
    Então eu devo ser redirecionado para a página do fluxo
    E devo ver o fluxo do curso
