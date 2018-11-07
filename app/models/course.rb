class Course < ApplicationRecord
  enum classification: [ :exatas, :humanas ]
  has_many :users
  has_many :course_subjects
  has_many :subjects,through: :course_subjects
  has_many :topics
  has_one :professor
  belongs_to :department, required: false

end
