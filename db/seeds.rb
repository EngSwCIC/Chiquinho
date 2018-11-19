# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

fast_mode = 2

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

departments = [{code: "052", initial: "CDT", name: "CENTRO DE APOIO AO DESENVOLVIMENTO TECNOLÓGICO"},
               {code: "383", initial: "CDS", name: "CENTRO DE DESENVOLVIMENTO SUSTENTÁVEL"},
               {code: "025", initial: "CEAM", name: "CENTRO DE ESTUDOS AVANÇADOS E MULTIDISCIPLINARES"},
               {code: "039", initial: "CET", name: "CENTRO DE EXCELÊNCIA EM TURISMO"},
               {code: "135", initial: "DAN", name: "DEPARTAMENTO DE ANTROPOLOGIA"},
               {code: "422", initial: "CEN", name: "DEPARTAMENTO DE ARTES CÊNICAS"},
               {code: "421", initial: "VIS", name: "DEPARTAMENTO DE ARTES VISUAIS"},
               {code: "121", initial: "CEL", name: "DEPARTAMENTO DE BIOLOGIA CELULAR"},
               {code: "129", initial: "BOT", name: "DEPARTAMENTO DE BOTÂNICA"},
               {code: "116", initial: "CIC", name: "DEPARTAMENTO DE CIÊNCIA DA COMPUTAÇÃO"},
               {code: "424", initial: "DIN", name: "DEPARTAMENTO DE DESENHO INDUSTRIAL"},
               {code: "127", initial: "ECL", name: "DEPARTAMENTO DE ECOLOGIA"},
               {code: "405", initial: "ECO", name: "DEPARTAMENTO DE ECONOMIA"},
               {code: "177", initial: "ENF", name: "DEPARTAMENTO DE ENFERMAGEM"},
               {code: "162", initial: "ENC", name: "DEPARTAMENTO DE ENGENHARIA CIVIL E AMBIENTAL"},
               {code: "163", initial: "ENE", name: "DEPARTAMENTO DE ENGENHARIA ELÉTRICA"},
               {code: "165", initial: "EFL", name: "DEPARTAMENTO DE ENGENHARIA FLORESTAL"},
               {code: "164", initial: "ENM", name: "DEPARTAMENTO DE ENGENHARIA MECÂNICA"},
               {code: "115", initial: "EST", name: "DEPARTAMENTO DE ESTATÍSTICA"},
               {code: "352", initial: "ELA", name: "DEPARTAMENTO DE ESTUDOS LATINO-AMERICANOS"},
               {code: "137", initial: "FIL", name: "DEPARTAMENTO DE FILOSOFIA"},
               {code: "128", initial: "FIT", name: "DEPARTAMENTO DE FITOPATOLOGIA"},
               {code: "126", initial: "GEM", name: "DEPARTAMENTO DE GENÉTICA E MORFOLOGIA"},
               {code: "138", initial: "GEA", name: "DEPARTAMENTO DE GEOGRAFIA"},
               {code: "139", initial: "HIS", name: "DEPARTAMENTO DE HISTÓRIA"},
               {code: "149", initial: "LET", name: "DEPARTAMENTO DE LÍNGUAS ESTRANGEIRAS E TRADUÇÃO"},
               {code: "147", initial: "LIP", name: "DEPARTAMENTO DE LINGUÍSTICA, PORTUGUÊS, LÍNG CLÁS"},
               {code: "113", initial: "MAT", name: "DEPARTAMENTO DE MATEMÁTICA"},
               {code: "423", initial: "MUS", name: "DEPARTAMENTO DE MÚSICA"},
               {code: "411", initial: "PPB", name: "DEPARTAMENTO DE PROCESSOS PSICOLOGICOS BÁSICOS"},
               {code: "157", initial: "PRO", name: "DEPARTAMENTO DE PROJETOS EXPRESSÃO E REPRESENTAÇÃO"},
               {code: "412", initial: "PED", name: "DEPARTAMENTO DE PSIC.ESCOLAR E DO DESENVOLVIMENTO"},
               {code: "413", initial: "PCL", name: "DEPARTAMENTO DE PSICOLOGIA CLÍNICA"},
               {code: "414", initial: "PST", name: "DEPARTAMENTO DE PSICOLOGIA SOCIAL E DO TRABALHO"},
               {code: "179", initial: "DSC",	 name: "DEPARTAMENTO DE SAÚDE COLETIVA"},
               {code: "136", initial: "SER",	 name: "DEPARTAMENTO DE SERVIÇO SOCIAL"},
               {code: "134", initial: "SOL",	 name: "DEPARTAMENTO DE SOCIOLOGIA"},
               {code: "158", initial: "TEC",	 name: "DEPARTAMENTO DE TECNOLOGIA EM ARQUIT. E URBANISMO"},
               {code: "148", initial: "TEL",	 name: "DEPARTAMENTO DE TEORIA LITERÁRIA E LITERATURA"},
               {code: "382", initial: "ZOO",	 name: "DEPARTAMENTO DE ZOOLOGIA"},
               {code: "404", initial: "CCA",	 name: "DEPTO DE CIÊNCIAS CONTÁBEIS E ATUARIAIS"},
               {code: "159", initial: "HAU",	 name: "DEPTO.DE TEORIA E HIST.EM ARQUITETURA E URBANISMO"},
               {code: "120", initial: "IBD",	 name: "DIREÇÃO DO INSTITUTO CIÊNCIAS BIOLÓGICAS"},
               {code: "40",  initial: "FACE", name: "FACULD. DE ECONOMIA, ADMINISTRAÇÃO E CONTABILIDADE"},
               {code: "540", initial: "FAV",	 name: "FACULDADE DE AGRONOMIA E MEDICINA VETERINÁRIA"},
               {code: "700", initial: "FCI",	 name: "FACULDADE DE CIÊNCIA DA INFORMAÇÃO"},
               {code: "17",  initial: "FS",	 name: "FACULDADE DE CIÊNCIAS DA SAÚDE"},
               {code: "430", initial: "FAC",	 name: "FACULDADE DE COMUNICAÇÃO"},
               {code: "500", initial: "FDD",	 name: "FACULDADE DE DIREITO"},
               {code: "19",  initial: "FE",	 name: "FACULDADE DE EDUCAÇÃO"},
               {code: "530", initial: "FEF",	 name: "FACULDADE DE EDUCAÇÃO FÍSICA"},
               {code: "570", initial: "FMD",	 name: "FACULDADE DE MEDICINA"},
               {code: "16",  initial: "FT",	 name: "FACULDADE DE TECNOLOGIA"},
               {code: "377", initial: "HUB",	 name: "HOSPITAL UNIVERSITÁRIO DE BRASÍLIA"},
               {code: "588", initial: "POL",	 name: "INSTITUTO DE CIÊNCIA POLÍTICA"},
               {code: "12",  initial: "IB",	 name: "INSTITUTO DE CIÊNCIAS BIOLÓGICAS"},
               {code: "13",  initial: "IH",	 name: "INSTITUTO DE CIÊNCIAS HUMANAS"},
               {code: "550", initial: "IFD",	 name: "INSTITUTO DE FÍSICA"},
               {code: "440", initial: "IGD",	 name: "INSTITUTO DE GEOCIÊNCIAS"},
               {code: "560", initial: "IQD",	 name: "INSTITUTO DE QUÍMICA"},
               {code: "589", initial: "REL",	 name: "INSTITUTO DE RELAÇÕES INTERNACIONAIS"},
               {code: "372", initial: "NMT",	 name: "NÚCLEO DE MEDICINA TROPICAL"}]


week_days = [{id: 0, day: "segunda"},
             {id: 1, day: "terça"},
             {id: 2, day: "quarta"},
             {id: 3, day: "quinta"},
             {id: 4, day: "sexta"},
             {id: 5, day: "sábado"},
             {id: 6, day: "domingo"}]

class_hours = [{id: 0, hour: "06:00"},
               {id: 1, hour: "08:00"},
               {id: 2, hour: "10:00"},
               {id: 3, hour: "12:00"},
               {id: 4, hour: "14:00"},
               {id: 5, hour: "16:00"},
               {id: 6, hour: "18:00"},
               {id: 7, hour: "20:00"},
               {id: 8, hour: "22:00"},
               {id: 9, hour: "24:00"},
               {id: 10, hour: "19:00"},
               {id: 11, hour: "20:50"},
               {id: 12, hour: "22:30"},]


# Clean up the database.

Flow.destroy_all

UserLikeComment.destroy_all
Comment.destroy_all
ProfessorSubjectUser.destroy_all
ProfessorSubject.destroy_all
CourseSubject.destroy_all
Professor.destroy_all
Topic.destroy_all
Forum.destroy_all
Schedule.destroy_all
User.destroy_all
Course.destroy_all
Subject.destroy_all
Department.destroy_all
SubjectClass.destroy_all
ClassSchedule.destroy_all
WeekDay.destroy_all
ClassHour.destroy_all


# Populate the database.

puts "Populando Departamentos"
departments.each do |department|
  @department = Department.new
  department.each do |key,value|
    @department[key] = value
  end
  @department.save
end
puts "Departamentos populados"

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
    puts @curso unless fast_mode >= 1
    @curso.opcode = JSON.parse(codigo[1])
    @curso.save
    puts "#{@curso.name} att" unless fast_mode >= 1
  else
    puts "não encontrado" unless fast_mode >= 2
  end
end

puts "Populando Matérias..."

Dir[Rails.root.join('db', 'materias_txts', '*.txt')].each do |filename|
  puts filename unless fast_mode >= 1
  file = File.new(filename, "r")
  contador = 1
  tipo = 0
  while (line = file.gets)
    if contador == 1
      line.slice!("Curso")
      codigo_curso = JSON.parse(line)[1]
      puts "codigo_curso: #{codigo_curso}" unless fast_mode >= 1
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
        p "#{Subject.last.name} criada com relacionamento para #{@course.name} do tipo #{tipo}" unless fast_mode >= 1
      else
        puts "curso nao encontrado..." unless fast_mode >= 2
        break
      end
    else
      if line[2] == 't'
        p "optativas:" unless fast_mode >= 1
        tipo = 1
      end
    end

    contador+= 1
  end
end

puts "Matérias Populadas"


puts "Populando fluxos..."

file = File.new("db/fluxos.rb", "r")
while (line = file.gets)
  codigo = JSON.parse(line.gsub("\n",""))
  @materia = Subject.find_by(code: codigo[0])
  @curso   = Course.find_by(code: codigo[1])
  semestre = codigo[2]
  unless @materia.nil? || @curso.nil?
    Flow.create!(subject: @materia, course: @curso, semester: semestre)
    puts "Matéria #{@materia.name} adicionada ao fluxo de #{@curso.name} no #{semestre}º semestre" unless fast_mode >= 2
  else
    puts "Matéria #{codigo[0]} ou curso #{codigo[1]} não encontrados" unless fast_mode >= 2
  end
end

puts "Fluxos Populados"

puts "Populando professores..."

file = File.new("db/professores_materias.rb", "r")
while (line = file.gets)
  codigo = JSON.parse(line.gsub("\n",""))
  @materia = Subject.find_by(code: codigo[1])
  @professor = Professor.find_or_create_by(name: codigo[0])
  if @materia
    ProfessorSubject.create(professor_id: @professor.id,subject_id: @materia.id)
    puts "Professor #{@professor.name} criado para matéria #{@materia.name}" unless fast_mode >= 1
  else
    puts "não encontrada materia" unless fast_mode >= 2
  end
end

# Código placeholder para popular salas dos professores.
# TODO Substituir esse código por um arquivo obtido de um web crawler.

Professor.find_each do |professor|
  professor.office = "Placeholder A1-55/11"
  puts "Professor #{professor.name} atualizado com sala #{professor.office}" unless fast_mode >= 1
  professor.save
end

puts "Professores populados"

puts "Populando dias da semana..."
week_days.each do |week_day|
  WeekDay.create(week_day)
end
puts "Dias da semana populados"

puts "Populando horários de aula..."
class_hours.each do |class_hour|
  ClassHour.create(class_hour)
end
puts "Horários de aula populados"

# Código placeholder para popular turmas as matérias e seus horários.
# TODO Substituir esse código por um arquivo obtido de um web crawler.
puts "Populando turmas e horários"
Subject.all.each do |subject|
  class_a = SubjectClass.create(name: "A", subject_id: subject.id, professor_id: subject.professors.first.id)
  class_b = SubjectClass.create(name: "B", subject_id: subject.id, professor_id: subject.professors.first.id)
  class_c = SubjectClass.create(name: "C", subject_id: subject.id, professor_id: subject.professors.first.id)

  3.times do |index|
    day = rand(0..6)
    hour = rand(0..12)
    ClassSchedule.create(subject_class_id: class_a.id, week_day_id: day, class_hour_id: hour)
    ClassSchedule.create(subject_class_id: class_b.id, week_day_id: day, class_hour_id: hour)
    ClassSchedule.create(subject_class_id: class_c.id, week_day_id: day, class_hour_id: hour)
  end

end
puts "Turmas e horários populados"