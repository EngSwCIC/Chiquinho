# == Schema Information
#
# Table name: professor_subject_users
#
#  id                   :bigint           not null, primary key
#  user_id              :bigint
#  professor_subject_id :bigint
#  trabalhos            :integer
#  provas               :integer
#  tarefas              :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class ProfessorSubjectUser < ApplicationRecord
  belongs_to :user
  belongs_to :professor_subject

  def self.get_avg(professor_subject_id, column)
    where(professor_subject_id: professor_subject_id).average(column).to_f.round(2)
  end
end
