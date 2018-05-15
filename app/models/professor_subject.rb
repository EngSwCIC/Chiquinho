class ProfessorSubject < ApplicationRecord
  belongs_to :professor
  belongs_to :subject
  has_many :comments
  has_many :users, through: :comments
end
