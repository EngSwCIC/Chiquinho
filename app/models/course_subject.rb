class CourseSubject < ApplicationRecord
  belongs_to :subject
  belongs_to :course

  enum kind: [:obrigatória, :optativa]
end
