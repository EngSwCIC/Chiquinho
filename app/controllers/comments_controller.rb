class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = current_user.comments.new(comments_params)
    @comment.professor_subject_id = params[:professor_subject_id]
    if @comment.save
      redirect_to request.referrer
    else
      redirect_to request.referrer
    end
  end

  private

  def comments_params
    params.require(:comments).permit(:content)
  end
end
