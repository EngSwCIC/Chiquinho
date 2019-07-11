# == Schema Information
#
# Table name: schedules
#
#  id         :bigint           not null, primary key
#  time_8     :string           default([]), is an Array
#  time_10    :string           default([]), is an Array
#  time_12    :string           default([]), is an Array
#  time_14    :string           default([]), is an Array
#  time_16    :string           default([]), is an Array
#  time_19    :string           default([]), is an Array
#  time_21    :string           default([]), is an Array
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Grade do aluno
class Schedule < ApplicationRecord
  belongs_to :user
  has_many :schedule_subjects
  has_many :subjects, through: :schedule_subjects

  # Horarios de inicio da grade
  SCHEDULES = %i[time_8 time_10 time_12 time_14 time_16 time_19 time_21].freeze

  # Itera pela grade para encontrar um dado subject e quando encontrado limpa o campo
  def find_and_remove_subject(subject)
    SCHEDULES.each do |schedule|
      send(schedule).each_with_index do |_day, i|
        remove_subject(schedule, subject, i)
      end
    end
    subject_id = subjects.find_by(name: subject).id
    schedule_subjects.find_by(subject_id: subject_id).destroy
  end

  # Remove um subject de um local da grade se corresponder ao subject buscado
  def remove_subject(schedule, subject, index)
    send(schedule)[index] = nil if send(schedule)[index] == subject
    save
  end

  def get_avg
    qtd_materias = subjects.length
    if qtd_materias.positive?
      { trabalhos: avg_trabalhos, provas: avg_provas, tarefas: avg_tarefas }
    else
      { trabalhos: 0, provas: 0, tarefas: 0 }
    end
  end

  def avg_trabalhos
    subjects.map { |s| s.get_avg[:trabalhos] }.sum.round(2)
  end

  def avg_provas
    subjects.map { |s| s.get_avg[:provas] }.sum.round(2)
  end

  def avg_tarefas
    subjects.map { |s| s.get_avg[:tarefas] }.sum.round(2)
  end
end
