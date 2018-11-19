class ClassSchedule < ApplicationRecord
  belongs_to :class_hour
  belongs_to :subject_class
  belongs_to :week_day
end
