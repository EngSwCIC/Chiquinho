# Model to save likes in subjects pages comments

class UserLikeComment < ApplicationRecord
  belongs_to :user
  belongs_to :comment
end
