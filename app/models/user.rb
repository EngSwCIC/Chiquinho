class User < ApplicationRecord
  before_create :create_user_schedule
  belongs_to :course
  belongs_to :professor_user_favorites
  has_many :professor, through: :professor_user_favorites
  has_one :schedule
  has_many :user_like_comments
  has_many :comments
  has_many :liked_comments, through: :user_like_comments, class_name: 'Comment'
  has_many :study_materials
  has_many :professor_subjects, through: :comments
  has_many :professor_subject_users
  has_many :professor_subjects, through: :professor_subject_users

  validates :matricula, presence: true
  validates :first_name,presence: true
  validates :last_name,presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
    "#{first_name} #{last_name}"
  end

  def create_user_schedule
    self.schedule = Schedule.new
    self.schedule.time_8 = Array.new(6)
    self.schedule.time_10 = Array.new(6)
    self.schedule.time_12 = Array.new(6)
    self.schedule.time_14 = Array.new(6)
    self.schedule.time_16 = Array.new(6)
    self.schedule.time_19 = Array.new(6)
    self.schedule.time_21 = Array.new(6)
  end
end
