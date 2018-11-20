class WeekDay < ApplicationRecord
  has_many :class_schedules
  has_many :class_hours, through: :class_schedules
  has_many :subject_class, through: :class_schedules
end
