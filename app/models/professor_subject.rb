# == Schema Information
#
# Table name: professor_subjects
#
#  id           :bigint           not null, primary key
#  professor_id :bigint
#  subject_id   :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ProfessorSubject < ApplicationRecord
  belongs_to :professor
  belongs_to :subject
  has_many :comments
  has_many :users, through: :comments
  has_many :professor_subject_users
  has_many :users, through: :professor_subject_users
end
