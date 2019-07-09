class TopicsController < ApplicationController
  def new
    @topic = Topic.new
    @forum = Forum.find_by(course_id: params[:course_id])
  end

  def create
    @topic = Topic.new(topic_params)
    forum = Forum.find_by(course_id: params[:course_id])
    @topic.forum_id = forum.id
    if @topic.save
      redirect_to course_forums_path(params[:course_id])
    else
      render :new
    end
  end

  def destroy
    forum = Forum.find(params[:course_id])
    @topic = Topic.find_by(forum_id: params[:course_id])
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to course_forums_path(params[:course_id]), notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :description)
  end
end
