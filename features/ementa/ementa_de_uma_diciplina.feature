#language: pt
#encoding: utf-8

Funcionalidade: ementa_de_uma_diciplina
  Como usuário autendicado ou não
  Para que eu vislumbre o conteudo abordado pela matéria
  Eu quero visualizar a ementa da matéria em questão

  Cenário: Visualizar a ementa de uma matéria
    Dado que eu estou na página da matéria "ORGANIZAÇÃO DE ARQUIVOS"
    Quando eu clicar no botão "Ver Ementa"
    Então eu devo ser redirecionado para a página da ementa
    E devo ver a ementa da matéria
