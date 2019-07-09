# == Schema Information
#
# Table name: course_subjects
#
#  id         :bigint           not null, primary key
#  subject_id :bigint
#  course_id  :bigint
#  kind       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CourseSubject < ApplicationRecord
  belongs_to :subject
  belongs_to :course

  enum kind: [:obrigatória, :optativa]
end
