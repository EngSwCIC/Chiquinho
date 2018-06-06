class Course < ApplicationRecord
  before_create :create_forum
  enum classification: [ :exatas, :humanas ]
  has_many :users
  has_many :course_subjects
  has_many :subjects,through: :course_subjects
  has_one :forum
  has_one :professor
  belongs_to :department


  private

  def create_forum
    self.forum = Forum.new
  end
end
