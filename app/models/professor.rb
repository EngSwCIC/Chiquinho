# == Schema Information
#
# Table name: professors
#
#  id             :bigint           not null, primary key
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  courses_id     :bigint
#  departments_id :bigint
#

class Professor < ApplicationRecord
  has_one :course
  has_many :professor_subjects
  has_many :subjects, through: :professor_subjects
  belongs_to :department, required: false
end
