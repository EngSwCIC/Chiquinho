class Subject < ApplicationRecord
  has_and_belongs_to_many :schedules
  has_and_belongs_to_many :courses
  has_many :professor_subjects
  has_many :professors, through: :professor_subjects
end
