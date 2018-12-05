# Model class to represent the relation between class and its starting hour
# == Attributes
# *+hour+ - Time variable to hold class starting hour
#
class ClassHour < ApplicationRecord
  has_many :class_schedules
  has_many :subject_class, through: :class_schedules
  has_many :week_days, through: :class_schedules
end
