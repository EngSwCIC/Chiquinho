# Model that keep the avaliations of a professor in a subject

class ProfessorSubjectUser < ApplicationRecord
  belongs_to :user
  belongs_to :professor_subject
  
  # Get's professor average on one column (trabalhos/tarefas/provas)
  def self.get_avg(professor_subject_id,column)
    self.where(professor_subject_id: professor_subject_id).average(column).to_f.round(2)
  end
end
