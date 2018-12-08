# Model class to help store and retrieve data about a Course
# == Attributes
# [+kind+] Describes if it is presential or distant course
# [+code+] Course's code for the MatriculaWeb system
# [+name+] String containing the Course's denomination
# [+turn+] Whether it is at daytime, nighttime or integral
# [+classification+] Classification given by the users of the system
# [+opcode+] Other code for the MatriculaWeb system
# [+professors_id+] Relation to the coordinator of the course
# [+departments_id+] Relation to the department of the course
class Course < ApplicationRecord
  before_create :create_forum
  enum classification: [ :exatas, :humanas ]
  has_many :users
  has_many :course_subjects
  has_many :subjects,through: :course_subjects
  has_one :forum
  has_one :professor
  belongs_to :department, required: false
  has_many :flows

  private

  def create_forum
    self.forum = Forum.new
  end
end
