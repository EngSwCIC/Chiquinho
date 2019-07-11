# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  matricula              :string
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  course_id              :bigint
#

class User < ApplicationRecord
  before_create :create_user_schedule
  belongs_to :course
  has_one :schedule
  has_many :user_like_comments
  has_many :comments
  has_many :liked_comments, through: :user_like_comments, class_name: 'Comment'
  has_many :study_materials
  has_many :professor_subjects, through: :comments
  has_many :professor_subject_users
  has_many :professor_subjects, through: :professor_subject_users

  validates :matricula, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
    "#{first_name} #{last_name}"
  end

  def create_user_schedule
    self.schedule = Schedule.new
    schedule.time_8 = Array.new(6)
    schedule.time_10 = Array.new(6)
    schedule.time_12 = Array.new(6)
    schedule.time_14 = Array.new(6)
    schedule.time_16 = Array.new(6)
    schedule.time_19 = Array.new(6)
    schedule.time_21 = Array.new(6)
  end
end
