class Forum < ApplicationRecord
  belongs_to :course
  has_many :topics
end
