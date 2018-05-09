class Subject < ApplicationRecord
  has_and_belongs_to_many :schedules
  has_many :course_subjects
  has_many :courses,through: :course_subjects
  has_many :professor_subjects
  has_many :professors, through: :professor_subjects
end
