# Model that keep the avaliations of a professor in a subject

class ProfessorSubjectUser < ApplicationRecord
  belongs_to :user
  belongs_to :professor_subject
  
  # Gets professor average on one column (trabalhos/tarefas/provas)
  def self.get_avg(professor_subject_id,column)
    self.where(professor_subject_id: professor_subject_id).average(column).to_f.round(2)
  end
  
  ##
  # For a given avaliation, compute the average based on works, tests and tasks scores
  
  def sumscore
    ((self.trabalhos || 0) + 
    (self.provas || 0) + 
    (self.tarefas || 0))/3.0
  end
  
end
