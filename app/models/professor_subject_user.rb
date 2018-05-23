class ProfessorSubjectUser < ApplicationRecord
  belongs_to :user
  belongs_to :professor_subject
end
