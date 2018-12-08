# Model that relates a subject to a professor (to be deprecated, will be substituted by subject_class)

class ProfessorSubject < ApplicationRecord
  belongs_to :professor
  belongs_to :subject
  has_many :comments
  has_many :users, through: :comments
  has_many :professor_subject_users
  has_many :users, through: :professor_subject_users
end
