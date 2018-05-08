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
           {:kind=>"Presencial", :code=>"612", :name=>"EDUCAÇÃO ARTÍSTICA", :turn=>"Diurno"},
           {:kind=>"Presencial", :code=>"795", :name=>"EDUCAÇÃO ARTÍSTICA", :turn=>"Noturno"},
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

materias = [
  ["", "113107", "ALGEBRA 1                       ", "002 002 000 006", "DC"],
  ["", "113476", "ALGORITMOS PROGR COMPUTADORES   ", "004 002 000 006", "AC"],
  ["", "116882", "AUTÔMATOS E COMPUTABILIDADE     ", "006 000 000 008", "DC"],
  ["", "116378", "BANCOS DE DADOS                 ", "004 000 000 004", "AC"],
  ["", "113034", "CÁLCULO 1                       ", "002 004 000 006", "DC"],
  ["", "113042", "CÁLCULO 2                       ", "004 002 000 006", "DC"],
  ["", "113417", "CALCULO NUMERICO                ", "004 000 000 006", "DC"],
  ["", "116351", "CIRCUITOS DIGITAIS              ", "004 002 000 006", "AC"],
  ["", "117951", "COMPILADORES                    ", "004 000 000 000", "AC"],
  ["", "117943", "COMPUTAÇÃO EXPERIMENTAL         ", "002 002 000 000", "AC"],
  ["", "116441", "ENGENHARIA DE SOFTWARE          ", "004 000 000 004", "AC"],
  ["", "116319", "ESTRUTURAS DE DADOS             ", "004 000 000 004", "AC"],
  ["", "117960", "FUNDAMENTOS SIST OPERACIONAIS   ", "004 000 000 000", "AC"],
  ["", "113450", "FUNDAMENTOS TEÓR DA COMPUTAÇÃO  ", "002 002 000 004", "AC"],
  ["", "116726", "INFORMATICA E SOCIEDADE         ", "002 000 000 000", "AC"],
  ["", "116653", "INTRO INTELIGENCIA ARTIFICIAL   ", "004 000 000 004", "AC"],
  ["", "113468", "INTROD SISTEMAS COMPUTACIONAIS  ", "002 002 000 004", "AC"],
  ["", "113093", "INTRODUCAO A ALGEBRA LINEAR     ", "002 002 000 006", "AC"],
  ["", "116343", "LINGUAGENS DE PROGRAMACAO       ", "004 000 000 004", "AC"],
  ["", "117366", "LÓGICA COMPUTACIONAL 1          ", "002 002 000 004", "AC"],
  ["", "117919", "METODOLOGIA CIENTÍFICA          ", "000 002 000 000", "AC"],
  ["", "116394", "ORG ARQ DE COMPUTADORES         ", "004 000 000 004", "AC"],
  ["", "116327", "ORGANIZAÇÃO DE ARQUIVOS         ", "002 002 000 004", "AC"],
  ["", "115045", "PROBABILIDADE E ESTATÍSTICA     ", "002 002 000 006", "DC"],
  ["", "117935", "PROGRAMAÇÃO CONCORRENTE         ", "002 002 000 000", "AC"],
  ["", "117536", "PROJETO ANÁLISE DE ALGORITMOS   ", "004 000 000 004", "AC"],
  ["", "116572", "REDES DE COMPUTADORES           ", "002 002 000 004", "AC"],
  ["", "117927", "SEGURANÇA COMPUTACIONAL         ", "004 000 000 004", "AC"],
  ["", "116416", "SISTEMAS DE INFORMACAO          ", "004 000 000 004", "AC"],
  ["", "116432", "SOFTWARE BASICO                 ", "004 000 000 004", "AC"],
  ["", "117901", "TEORIA E APLICAÇÃO DE GRAFOS    ", "002 002 000 004", "AC"],
  ["", "116912", "TRABALHO DE GRADUAÇÃO 1         ", "000 002 000 002", "DC"],
  ["", "116921", "TRABALHO DE GRADUAÇÃO 2         ", "000 004 000 004", "DC"],
  ["", "117889", "TECNICAS DE PROGRAMAÇÃO 1       ", "002 002 000 000", "AC"],
  ["", "117897", "TECNICAS DE PROGRAMAÇÃO 2       ", "002 002 000 000", "AC"],
]

# Course.delete_all
# Subject.delete_all
#
# puts "Populando Cursos..."
# courses.each do |course|
#   @course = Course.new
#   course.each do |key,value|
#     @course[key] = value
#   end
#   @course.save
# end
# puts "Cursos Populados"
#
# puts "Populando Matérias..."
#
# materias.each do |materia|
#   @materia = Subject.create(code: materia[1].to_i, name: materia[2].strip, credits: materia[3],area: materia[4])
# end
#
# puts "Matérias Populadas"