# == Schema Information
#
# Table name: comments
#
#  id                   :bigint           not null, primary key
#  content              :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :bigint
#  professor_subject_id :bigint
#  subject_id           :bigint
#

class Comment < ApplicationRecord
  belongs_to :user
  has_many :user_like_comments
  has_many :users_that_liked, through: :user_like_comments, class_name: 'User'
  has_one :professor_subject
  has_one :subject

  cattr_accessor :current_user

  def subject_id=(data); end

  def likes
    UserLikeComment.where(comment_id: id, like: true).size
  end

  def user_liked?
    @user_liked_comment = UserLikeComment.where(user_id: Comment.current_user, comment_id: id).first
    if @user_liked_comment.nil? || @user_liked_comment.like == false
      false
    else
      true
    end
  end

  validates_presence_of :content
end
