# Model class to represent the classes of a subject
# == Attributes
# * +name+ - string to name
# * +subject_id+ - Foreign key to subject
# * +professor_id+ - Foreign key to professor
class SubjectClass < ApplicationRecord
  belongs_to :subject
  belongs_to :professor
  has_many :class_schedules
  has_many :class_hours, through: :class_schedules
  has_many :week_days, through: :class_schedules
end
