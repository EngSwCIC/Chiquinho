class Professor < ApplicationRecord
  has_many :professor_subjects
  has_many :subjects, through: :professor_subjects
end
