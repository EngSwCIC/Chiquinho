# == Schema Information
#
# Table name: forums
#
#  id         :bigint           not null, primary key
#  course_id  :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Forum < ApplicationRecord
  belongs_to :course
  has_many :topics
end
