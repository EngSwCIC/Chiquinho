class TopicsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @topic = Topic.new
    @forum = Forum.find(params[:forum_id])
    @topic.forum_id = @forum.id
    @topic.user_id = current_user.id
  end

  def create
    @topic = Topic.new(topic_params)
    @forum = Forum.find_by(id: params[:forum_id])
    @topic.forum_id = @forum.id
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to course_forum_path(params[:course_id], params[:forum_id])
    else
      render :new
    end
  end

  def edit
    @forum = Forum.find(params[:forum_id])
  end

  def update
    if @topic.user_id == current_user.id
      respond_to do |format|
        if @topic.update(topic_params)
          format.html { redirect_to course_forum_path(params[:course_id], params[:forum_id]), notice: 'Topic was successfully updated.' }
          format.json { render :show, status: :ok, location: @topic }
        else
          format.html { render :edit }
          format.json { render json: @topic.errors, status: :unprocessable_entity }
        end 
      end
    end
  end

  def destroy
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
    params.require(:topic).permit(:title, :description, :user_id, :forum_id)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

end