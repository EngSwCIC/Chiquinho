class ClassHour < ApplicationRecord
  has_many :class_schedules, dependent: :destroy
  has_many :subject_class, through: :class_schedules
  has_many :week_days, through: :class_schedules
end
