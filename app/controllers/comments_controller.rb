class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = current_user.comments.new(comments_params)
    if @comment.save
      redirect_to request.referrer
    else
      redirect_to request.referrer
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:content, :professor_subject_id)
  end
end
