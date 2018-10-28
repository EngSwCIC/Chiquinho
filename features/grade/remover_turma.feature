#language: pt
#encoding: utf-8

Funcionalidade: Remover turma da grade horária
  Como usuário autenticado
  Para que eu estime meu semestre
  Eu quero poder retirar as turmas que vou fazer

  Cenário: Remover 1 turma na minha grade e estimar créditos
    Dado que eu tenha me cadastrado e me autenticado
    E que eu tenha adicionado uma matéria na minha grade
    Quando eu clicar no botão de remover essa matéria
    Então não devo ver mais essa matéria na grade
