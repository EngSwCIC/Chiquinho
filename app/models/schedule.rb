# Model that represent the schedule of an user

class Schedule < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :subjects

  # Get difficulty of a schedule based on avaliations for each column (trabalhos/provas/tarefas)
  def get_avg
    @trabalhos = 0
    @provas = 0
    @tarefas = 0
    qtd_materias = self.subjects.length
    if qtd_materias > 0
      self.subjects.each do |subject|
        @trabalhos += subject.get_avg[:trabalhos]
        @provas += subject.get_avg[:provas]
        @tarefas += subject.get_avg[:tarefas]
      end

      @trabalhos /= qtd_materias
      @provas /= qtd_materias
      @tarefas /= qtd_materias
      {trabalhos: @trabalhos.round(2), provas: @provas.round(2), tarefas: @tarefas.round(2)}
    else
      {trabalhos: 0, provas: 0, tarefas: 0}
    end
  end
end
