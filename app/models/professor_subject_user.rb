class ProfessorSubjectUser < ApplicationRecord
  belongs_to :user
  belongs_to :professor_subject

  def self.get_avg(professor_subject_id,column)
    self.where(professor_subject_id: professor_subject_id).average(column).to_f.round(2)
  end
end
