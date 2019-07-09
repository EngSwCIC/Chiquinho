class Schedule < ApplicationRecord
  belongs_to :user
  has_many :schedule_subjects
  has_many :subjects, through: :schedule_subjects

  SCHEDULES = %i[time_8 time_10 time_12 time_14 time_16 time_19 time_21].freeze

  def find_and_remove_subject(subject)
    SCHEDULES.each do |schedule|
      send(schedule).each_with_index do |_day, i|
        remove_subject(schedule, subject, i)
      end
    end
    subject_id = subjects.find_by(name: subject).id
    schedule_subjects.find_by(subject_id: subject_id).destroy
  end

  def remove_subject(schedule, subject, index)
    send(schedule)[index] = nil if send(schedule)[index] == subject
    save
  end

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
