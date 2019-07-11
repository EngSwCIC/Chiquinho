FactoryBot.define do
  factory :course do
    kind { "Presencial" }
    code { 1341 }
    name { "ENGENHARIA DE COMPUTAÇÃO" }
    turn { "Diurno" }
    classification { "exatas" }
    opcode { 1741 }
  end
end
