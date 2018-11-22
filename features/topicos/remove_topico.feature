#language: pt
#encoding: utf-8

Funcionalidade: Remover logicamente um tópico dentro do fórum do sistema
  Como usuário logado no sistema
  Para que eu possa ter controle sobre meus tópicos
  Eu quero poder remover um tópico de discussão criado por mim

  Cenário: Remover tópico de discussão no fórum do curso
    Dado que eu esteja na página do curso de "ENGENHARIA DE COMPUTAÇÃO"
    Quando eu clicar no link "Forum do curso"
    E eu clicar no botão "Remover" em um tópico criado por mim
    E eu clicar no botão 'Confirmar'
    Então o tópico criado por mim deverá ser removido
    E eu devo ser redirecionado para a página de tópicos do fórum do curso


  Cenário: Remover tópico de discussão no fórum da matéria
    Dado que eu esteja na página da matéria de "ENGENHARIA DE SOFTWARE "
    Quando eu clicar no link "Forum da materia"
    E eu clicar no botão "Remover" em um tópico criado por mim
    E eu clicar no botão 'Confirmar'
    Então o tópico criado por mim deverá ser removido
    E eu devo ser redirecionado para a página de tópicos do fórum da matéria

  Cenário: Remover tópico de discussão no fórum do professor
    Dado que eu esteja na página da professora "GENAINA NUNES RODRIGUES"
    Quando eu clicar no link "Forum do professor"
    E eu clicar no botão "Remover" em um tópico criado por mim
    E eu clicar no botão 'Confirmar'
    Então o tópico criado por mim deverá ser removido
    E eu devo ser redirecionado para a página de tópicos do fórum do professor

  Cenário: Remover tópico de discussão no fórum
    Dado que eu esteja na página do fórum
    E eu clicar no botão "Remover" em um tópico criado por mim
    E eu clicar no botão 'Confirmar'
    Então o tópico criado por mim deverá ser removido
    E eu devo ser redirecionado para a página de tópicos do fórum

  Cenário: Remover tópico de resposta no fórum
    Dado que eu esteja em alguma página do fórum
    E eu clicar no botão "Remover" em um tópico criado por mim
    E eu clicar no botão 'Confirmar'
    Então o tópico criado por mim deverá ser removido
    E eu devo ser redirecionado para a página de tópicos do fórum
