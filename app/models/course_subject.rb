# Model class that represent the relation between courses and their subjects

class CourseSubject < ApplicationRecord
  belongs_to :subject
  belongs_to :course

  enum kind: [:obrigatória, :optativa]
end
