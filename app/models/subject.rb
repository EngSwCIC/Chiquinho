class Subject < ApplicationRecord
  require 'nokogiri'
  require 'open-uri'

  has_one :rating
  has_and_belongs_to_many :schedules
  has_many :course_subjects
  has_many :courses,through: :course_subjects
  has_many :professor_subjects
  has_many :study_materials
  has_many :professors, through: :professor_subjects
  has_many :comments
  has_many :flows
  def get_avg
    trabalhos = 0
    provas = 0
    tarefas = 0
    self.professors.uniq.each do |professor|
      professor_subject = ProfessorSubject.where(professor_id: professor).find_by(subject_id: self.id)
      trabalhos += ProfessorSubjectUser.get_avg(professor_subject,:trabalhos)
      provas += ProfessorSubjectUser.get_avg(professor_subject,:provas)
      tarefas += ProfessorSubjectUser.get_avg(professor_subject,:tarefas)
    end
    length_professors = self.professors.uniq.length
    if length_professors != 0
      trabalhos /= length_professors
      provas /= length_professors
      tarefas /= length_professors
    end

    {trabalhos: trabalhos.round(2), provas: provas.round(2), tarefas: tarefas.round(2)}
  end

  def dificuldade_geral
    averages = self.get_avg
    (averages[:trabalhos] + averages[:provas] + averages[:tarefas])/3.0
  end

  def self.ementaMW(code)
  	begin
#	    Nokogiri::HTML(open("https://matriculaweb.unb.br/graduacao/disciplina.aspx?cod=#{code}")).css("table#datatable").css("tr")[6].css("td")[0].text
	  	"Não encontrada no MW"
	  rescue
	  	"Não encontrada no MW"
	  end
  end

end
