# Model class to represent the relation between class and user schedule
# == Attributes
# * +subject_class_id+ - Foreign key to class
# * +week_day_id+ - Foreign key to day of the week
# * +class_hour_id+ - Foreign key to starting hour
class ClassSchedule < ApplicationRecord
  belongs_to :class_hour
  belongs_to :subject_class
  belongs_to :week_day
end
