class ProfessorSubject < ApplicationRecord
  belongs_to :professor
  belongs_to :subject
end
