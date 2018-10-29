class Professor < ApplicationRecord
  has_one :course
  has_many :professor_subjects
  has_many :subjects, through: :professor_subjects
  belongs_to :professor_user_favorites
  has_many :users, through: :professor_user_favorites
  belongs_to :department, required: false
end
