# == Schema Information
#
# Table name: subjects
#
#  id         :bigint           not null, primary key
#  code       :integer
#  name       :string
#  credits    :string
#  area       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subject < ApplicationRecord
  has_one :rating
  has_and_belongs_to_many :schedules
  has_many :course_subjects
  has_many :courses, through: :course_subjects
  has_many :professor_subjects
  has_many :study_materials
  has_many :professors, through: :professor_subjects
  has_many :comments

  def get_avg
    trabalhos = 0
    provas = 0
    tarefas = 0
    professors.uniq.each do |professor|
      professor_subject = ProfessorSubject.where(professor_id: professor).find_by(subject_id: id)
      trabalhos += ProfessorSubjectUser.get_avg(professor_subject, :trabalhos)
      provas += ProfessorSubjectUser.get_avg(professor_subject, :provas)
      tarefas += ProfessorSubjectUser.get_avg(professor_subject, :tarefas)
    end
    length_professors = professors.uniq.length
    if length_professors != 0
      trabalhos /= length_professors
      provas /= length_professors
      tarefas /= length_professors
    end

    { trabalhos: trabalhos.round(2), provas: provas.round(2), tarefas: tarefas.round(2) }
  end

  def dificuldade_geral
    averages = get_avg
    (averages[:trabalhos] + averages[:provas] + averages[:tarefas]) / 3.0
  end

  def self.find_by_name(name)
    where('unaccent(lower(subjects.name)) LIKE ?', "%#{name.downcase}%")
  end

  def self.find_by_professor(professor)
    where("professors.name LIKE '%" + professor.upcase + "%'")
  end

  def self.find_by_area(area)
    where("subjects.area LIKE '%" + area.upcase + "%'")
  end

  def self.find_by_code(code)
    if code.present?
      where(code: code.to_s)
    else
      all
    end
  end

  def self.find_by_creditos(creditos)
    where("subjects.credits LIKE '00" + creditos.to_s + "%' ")
  end
end
