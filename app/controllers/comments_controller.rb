class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  def create
    @comment = current_user.comments.new(comments_params)
    @comment[:subject_id] = params[:comment][:subject_id]
    if @comment.save
      respond_to do |format|
        format.html { redirect_to request.referrer }
        format.json
      end
    else
      flash[:error] = 'Não foi possível salvar seu comentário'
      redirect_to request.referrer
    end
  end

  def like_comment
    @like_comment = UserLikeComment.find_or_create_by(user_id: params[:user_id], comment_id: params[:comment_id])
    @like_comment.like = if @like_comment.like.nil? || @like_comment.like == false
                           true
                         else
                           false
                         end
    @like_comment.save
    redirect_to request.referrer
  end

  private

  def comments_params
    params.require(:comment).permit(:content, :professor_subject_id, :subject_id)
  end
end
