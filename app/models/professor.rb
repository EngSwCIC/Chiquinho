class Professor < ApplicationRecord
  has_one :course
  has_many :professor_subjects
  has_many :subjects, through: :professor_subjects
  has_many :professor_user_favorites
  has_many :users, through: :professor_user_favorites
  has_many :subject_classes, dependent: :destroy
  belongs_to :department, required: false
end
