# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

courses = [{:kind=>"Presencial", :code=>"19", :name=>"ADMINISTRAÇÃO", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"701", :name=>"ADMINISTRAÇÃO", :turn=>"Noturno"},
           {:kind=>"Presencial", :code=>"86", :name=>"AGRONOMIA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"27", :name=>"ARQUITETURA E URBANISMO", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"1422", :name=>"ARQUITETURA E URBANISMO", :turn=>"Noturno"},
           {:kind=>"Presencial", :code=>"728", :name=>"ARQUIVOLOGIA", :turn=>"Noturno"},
           {:kind=>"Presencial", :code=>"680", :name=>"ARTES CÊNICAS", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"1309", :name=>"ARTES CÊNICAS", :turn=>"Noturno"},
           {:kind=>"Presencial", :code=>"671", :name=>"ARTES VISUAIS", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"1023", :name=>"ARTES VISUAIS", :turn=>"Noturno"},
           {:kind=>"Presencial", :code=>"191", :name=>"BIBLIOTECONOMIA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"1538", :name=>"BIOTECNOLOGIA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"370", :name=>"CIÊNCIA DA COMPUTAÇÃO", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"710", :name=>"CIÊNCIA POLÍTICA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"1333", :name=>"CIÊNCIAS AMBIENTAIS", :turn=>"Noturno"},
           {:kind=>"Presencial", :code=>"94", :name=>"CIÊNCIAS BIOLÓGICAS", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"736", :name=>"CIÊNCIAS BIOLÓGICAS", :turn=>"Noturno"},
           {:kind=>"Presencial", :code=>"507", :name=>"CIÊNCIAS CONTÁBEIS", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"809", :name=>"CIÊNCIAS CONTÁBEIS", :turn=>"Noturno"},
           {:kind=>"Presencial", :code=>"35", :name=>"CIÊNCIAS ECONÔMICAS", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"213", :name=>"CIÊNCIAS SOCIAIS", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"906", :name=>"COMPUTAÇÃO", :turn=>"Noturno"},
           {:kind=>"Presencial", :code=>"205", :name=>"COMUNICAÇÃO SOCIAL", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"1473", :name=>"COMUNICAÇÃO SOCIAL", :turn=>"Noturno"},
           {:kind=>"Presencial", :code=>"698", :name=>"DESIGN", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"43", :name=>"DIREITO", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"817", :name=>"DIREITO", :turn=>"Noturno"},
           {:kind=>"Presencial", :code=>"329", :name=>"EDUCAÇÃO FÍSICA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"1589", :name=>"EDUCAÇÃO FÍSICA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"442", :name=>"ENFERMAGEM", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"1457", :name=>"ENGENHARIA AMBIENTAL", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"582", :name=>"ENGENHARIA CIVIL", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"1341", :name=>"ENGENHARIA DE COMPUTAÇÃO", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"1376", :name=>"ENGENHARIA DE PRODUÇÃO", :turn=>"Noturno"},
           {:kind=>"Presencial", :code=>"892", :name=>"ENGENHARIA DE REDES DE COMUNICAÇÃO", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"591", :name=>"ENGENHARIA ELÉTRICA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"396", :name=>"ENGENHARIA FLORESTAL", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"604", :name=>"ENGENHARIA MECÂNICA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"949", :name=>"ENGENHARIA MECATRÔNICA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"1562", :name=>"ENGENHARIA QUÍMICA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"353", :name=>"ESTATÍSTICA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"876", :name=>"FARMÁCIA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"1449", :name=>"FARMÁCIA", :turn=>"Noturno"},
           {:kind=>"Presencial", :code=>"221", :name=>"FILOSOFIA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"1503", :name=>"FILOSOFIA", :turn=>"Noturno"},
           {:kind=>"Presencial", :code=>"124", :name=>"FÍSICA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"744", :name=>"FÍSICA", :turn=>"Noturno"},
           {:kind=>"Presencial", :code=>"1384", :name=>"GEOFÍSICA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"264", :name=>"GEOGRAFIA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"132", :name=>"GEOLOGIA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"1511", :name=>"GESTÃO DE AGRONEGÓCIOS", :turn=>"Noturno"},
           {:kind=>"Presencial", :code=>"1350", :name=>"GESTÃO DE POLÍTICAS PÚBLICAS", :turn=>"Noturno"},
           {:kind=>"Presencial", :code=>"230", :name=>"HISTÓRIA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"1392", :name=>"HISTÓRIA", :turn=>"Noturno"},
           {:kind=>"Presencial", :code=>"337", :name=>"JORNALISMO", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"51", :name=>"LETRAS", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"779", :name=>"LETRAS", :turn=>"Noturno"},
           {:kind=>"Presencial", :code=>"825", :name=>"LETRAS", :turn=>"Noturno"},
           {:kind=>"Presencial", :code=>"914", :name=>"LETRAS", :turn=>"Noturno"},
           {:kind=>"Presencial", :code=>"639", :name=>"LETRAS-TRADUÇÃO", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"1414", :name=>"LETRAS-TRADUÇÃO ESPANHOL", :turn=>"Noturno"},
           {:kind=>"Presencial", :code=>"345", :name=>"LÍNGUA DE SINAIS BRASILEIRA/PORTUGUÊS COMO SEGUNDA LÍNGUA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"1465", :name=>"LÍNGUAS ESTRANGEIRAS APLICADAS - MSI", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"141", :name=>"MATEMÁTICA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"752", :name=>"MATEMÁTICA", :turn=>"Noturno"},
           {:kind=>"Presencial", :code=>"159", :name=>"MEDICINA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"884", :name=>"MEDICINA VETERINÁRIA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"1368", :name=>"MUSEOLOGIA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"175", :name=>"MÚSICA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"281", :name=>"MÚSICA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"1406", :name=>"MÚSICA", :turn=>"Noturno"},
           {:kind=>"Presencial", :code=>"451", :name=>"NUTRIÇÃO", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"647", :name=>"ODONTOLOGIA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"60", :name=>"PEDAGOGIA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"787", :name=>"PEDAGOGIA", :turn=>"Noturno"},
           {:kind=>"Presencial", :code=>"183", :name=>"PSICOLOGIA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"167", :name=>"QUÍMICA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"761", :name=>"QUÍMICA", :turn=>"Noturno"},
           {:kind=>"Presencial", :code=>"1481", :name=>"QUÍMICA TECNOLÓGICA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"400", :name=>"RELAÇÕES INTERNACIONAIS", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"1431", :name=>"SAÚDE COLETIVA", :turn=>"Noturno"},
           {:kind=>"Presencial", :code=>"272", :name=>"SERVIÇO SOCIAL", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"1490", :name=>"SERVIÇO SOCIAL", :turn=>"Noturno"},
           {:kind=>"Presencial", :code=>"1554", :name=>"TEORIA CRÍTICA E HISTÓRIA DA ARTE", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"1520", :name=>"TURISMO", :turn=>"Diurno"},
           {:kind=>"Distância", :code=>"1112", :name=>"ADMINISTRAÇÃO", :turn=>"Diurno"},
           {:kind=>"Distância", :code=>"1546", :name=>"ADMINISTRAÇÃO PÚBLICA", :turn=>"Diurno"},
           {:kind=>"Distância", :code=>"1155", :name=>"ARTES VISUAIS", :turn=>"Diurno"},
           {:kind=>"Distância", :code=>"1325", :name=>"CIÊNCIAS BIOLÓGICAS", :turn=>"Diurno"},
           {:kind=>"Distância", :code=>"1163", :name=>"EDUCAÇÃO FÍSICA", :turn=>"Diurno"},
           {:kind=>"Distância", :code=>"388", :name=>"FÍSICA", :turn=>"Diurno"},
           {:kind=>"Distância", :code=>"1317", :name=>"GEOGRAFIA", :turn=>"Diurno"},
           {:kind=>"Distância", :code=>"1147", :name=>"LETRAS", :turn=>"Diurno"},
           {:kind=>"Distância", :code=>"1139", :name=>"MÚSICA", :turn=>"Diurno"},
           {:kind=>"Distância", :code=>"1180", :name=>"PEDAGOGIA", :turn=>"Diurno"},
           {:kind=>"Distância", :code=>"299", :name=>"TEATRO", :turn=>"Diurno"},
           {:kind=>"Distância", :code=>"1171", :name=>"TEATRO", :turn=>"Diurno"}]

ProfessorSubject.delete_all
CourseSubject.delete_all
Professor.delete_all
Course.delete_all
Subject.delete_all

puts "Populando Cursos..."
courses.each do |course|
  @course = Course.new
  course.each do |key,value|
    @course[key] = value
  end
  @course.save
end
puts "Cursos Populados"

file = File.new("db/codigos_cursos_mw.rb", "r")
while (line = file.gets)
  codigo = JSON.parse(line)
  @curso = Course.find_by(code: codigo[0])
  if @curso
    puts @curso
    @curso.opcode = JSON.parse(codigo[1])
    @curso.save
    puts "#{@curso.name} att"
  else
    puts "não encontrado"
  end
end

puts "Populando Matérias..."

Dir[Rails.root.join('db', 'materias_txts', '*.txt')].each do |filename|
  puts filename
  file = File.new(filename, "r")
  contador = 1
  tipo = 0
  while (line = file.gets)
    if contador == 1
      line.slice!("Curso")
      codigo_curso = JSON.parse(line)[1]
      puts "codigo_curso: #{codigo_curso}"
    end
    if contador > 11 && line[1] == '"'
      arr = JSON.parse(line)
      @subject = Subject.find_or_create_by(code: arr[1]) do |subject|
        subject.name = arr[2].strip
        subject.credits = arr[3]
        subject.area = arr[4]
      end
      @course = Course.find_by(opcode: codigo_curso)
      if @course
        CourseSubject.create(subject_id: @subject.id, course_id: @course.id,kind: tipo)
        p "#{Subject.last.name} criada com relacionamento para #{@course.name} do tipo #{tipo}"
      else
        puts "curso nao encontrado..."
        break
      end
    else
      if line[2] == 't'
        p "optativas:"
        tipo = 1
      end
    end

    contador+= 1
  end
end

puts "Matérias Populadas"

puts "Populando professores..."

file = File.new("db/professores_materias.rb", "r")
while (line = file.gets)
  codigo = JSON.parse(line.gsub("\n",""))
  @materia = Subject.find_by(code: codigo[1])
  @professor = Professor.find_or_create_by(name: codigo[0])
  if @materia
    ProfessorSubject.create(professor_id: @professor.id,subject_id: @materia.id)
    puts "Professor #{@professor.name} criado para matéria #{@materia.name}"
  else
    puts "não encontrada materia"
  end
end
puts "Professores populados"

puts "Populando Departamentos"
Department.create(name: 'DEPARTAMENTO DE CIENCIA DA COMPUTAÇAO', code: '116', initial: 'CIC')
puts "Departamentos populados"