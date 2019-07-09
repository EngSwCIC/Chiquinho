class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  before_action :set_comment, only: [:destroy, :update, :edit]

  def create
    @comment = current_user.comments.new(comments_params)
    @comment[:subject_id] = params[:comment][:subject_id]
    if @comment.save
      respond_to do |format|
        format.html {redirect_to request.referrer}
        format.json
      end
    else
      flash[:error] = 'Não foi possível salvar seu comentário'
      redirect_to request.referrer
    end
  end

  def destroy
    if @comment.user_id == current_user.id 
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to course_forum_topic_path(params[:course_id],params[:forum_id], params[:topic_id]), notice: 'O comentário foi removido com sucesso.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to course_forum_topic_path(params[:course_id],params[:forum_id], params[:topic_id]), notice: 'O comentário não foi removido.' }
        format.json { head :no_content }
      end
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
  end

  def update
    if @comment.user_id == current_user.id
      respond_to do |format|
        if @comment.update(comments_params)
          format.html { redirect_to course_forum_topic_path(params[:course_id], params[:forum_id], params[:topic_id]), notice: 'comment was successfully updated.' }
          format.json { render :show, status: :ok, location: @comment }
        end
      end
    end
  end

  def like_comment
    @like_comment = UserLikeComment.find_or_create_by(user_id: params[:user_id], comment_id: params[:comment_id])
    if @like_comment.like == nil || @like_comment.like == false
      @like_comment.like = true
    else
      @like_comment.like = false
    end
    @like_comment.save
    redirect_to request.referrer
  end

  private

  def comments_params
    params.require(:comment).permit(:content, :professor_subject_id, :subject_id, :topic_id, :user_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end
