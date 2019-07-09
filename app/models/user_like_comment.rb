# == Schema Information
#
# Table name: user_like_comments
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  comment_id :bigint
#  like       :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserLikeComment < ApplicationRecord
  belongs_to :user
  belongs_to :comment
end
