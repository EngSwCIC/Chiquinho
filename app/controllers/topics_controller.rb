class TopicsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :set_topic, only: [:show]
  def new
    @topic = Topic.new
    @forum = Forum.find(params[:forum_id])
    @topic.forum_id = @forum.id
    @topic.user_id = current_user.id
  end

  def create
    @topic = Topic.new(topic_params)
    forum = Forum.find_by(id: params[:forum_id])
    @topic.forum_id = forum.id
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to course_forum_path(params[:course_id], params[:forum_id])
    else
      render :new
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    if @topic.user_id == current_user.id 
      @topic.destroy
      respond_to do |format|
        format.html { redirect_to course_forum_path(params[:course_id],params[:forum_id]), notice: 'O tópico foi removido com sucesso.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to course_forum_path(params[:course_id],params[:forum_id]), notice: 'O tópico não foi removido com sucesso!' }
        format.json { head :no_content }
      end
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:title, :description)
  end
end