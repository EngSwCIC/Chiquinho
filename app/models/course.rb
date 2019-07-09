# == Schema Information
#
# Table name: courses
#
#  id             :bigint           not null, primary key
#  kind           :string
#  code           :integer
#  name           :string
#  turn           :string
#  classification :integer          default("exatas")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  opcode         :integer
#  professors_id  :bigint
#  departments_id :bigint
#

class Course < ApplicationRecord
  before_create :create_forum
  enum classification: %i[exatas humanas]
  has_many :users
  has_many :course_subjects
  has_many :subjects, through: :course_subjects
  has_one :forum
  has_one :professor
  belongs_to :department, required: false

  private

  def create_forum
    self.forum = Forum.new
  end
end
