Dado("que eu esteja no fórum do curso de {string}") do |course_name|
    course_params = {kind: "Presencial", code: 370, name: "CIÊNCIA DA COMPUTAÇÃO", turn: "Diurno", classification: "exatas", opcode: nil}
    Course.create(course_params)
    course = Course.find_by(name: course_name)
    visit course_path(course)
end

Dado("que eu esteja na página matéria {string}") do |subject_name|
    subject_params = {code: 1590, name: "ENGENHARIA DE SOFTWARE", credits: "004 000 000 004", area: "AC"}
    Subject.create(subject_params)
    subject = Subject.find_by(name: subject_name)
    visit subject_path(subject)
end

Dado("que eu esteja na página do professor {string}") do |professor_name|
    professor_params = {name: "GENAINA NUNES RODRIGUES"}
    Professor.create(professor_params)
    professor = Professor.find_by(name: professor_name)
    visit professor_path(professor)
end
  
Quando("preencher o fórmulário com:") do |table|
    table.rows_hash.each do |field,value|
        fill_in field,	with: value 
    end
end
  
Então("eu devo ser redirecionado para a página de tópicos") do
    expect(current_path).to eq(topics_path())
end

Então("eu devo ser redirecionado para a página de cadastro") do
    expect(current_path).to eq('/users/sign_in')
end
  
Então("ver os dados:") do |table|
    table.rows_hash.each do |field, value|
        expect(page).to have_content(value)
    end
end

Dado ("que eu entre no site") do
  visit root_path
end

Dado("que eu esteja logado") do
    steps %Q{
    Dado que eu entre no site
      Quando eu clicar no link "Entrar"
      E eu clicar no link "Novo usuário? Cadastre-se"
      E preencher o formulário com:
      |user_email|nicknish@hotmail.com     |
      |user_matricula |150019343           |
      |user_first_name      |Nicholas      |
      |user_last_name       |Marques       |
      |user_password  |123456              |
      |user_password_confirmation|123456   |
      E selecionar o meu curso ""
      E clicar no botão "Cadastrar-se"
  }
end