class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  def create
    @comment = current_user.comments.new(comments_params)
    @comment[:subject_id] = params[:comment][:subject_id]
    if @comment.save
      respond_to do |format|
        format.html {redirect_to request.referrer}
        format.json
      end
    else
      redirect_to request.referrer
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:content, :professor_subject_id, :subject_id)
  end
end
