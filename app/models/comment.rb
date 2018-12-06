# Class to model comments on subject page

class Comment < ApplicationRecord
  belongs_to :user
  has_many :user_like_comments
  has_many :users_that_liked, through: :user_like_comments, class_name: 'User'
  has_one :professor_subject
  has_one :subject


  cattr_accessor :current_user

  def subject_id=(data)
  end

  # Count likes in subject's page comment
  def likes
    UserLikeComment.where(comment_id: self.id, like: true).size
  end

  # Verify if user already like this comment
  def user_liked?
    @user_liked_comment = UserLikeComment.where(user_id: Comment.current_user, comment_id: self.id).first
    if @user_liked_comment == nil || @user_liked_comment.like == false
      false
    else
      true
    end
  end

  validates_presence_of :content
end
