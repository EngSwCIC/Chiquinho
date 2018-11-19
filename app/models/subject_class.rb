class SubjectClass < ApplicationRecord
  belongs_to :subject
  belongs_to :professor
  has_many :class_schedules, dependent: :destroy
  has_many :class_hours, through: :class_schedules
  has_many :week_days, through: :class_schedules
end
