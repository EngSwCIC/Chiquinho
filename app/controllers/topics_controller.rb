class TopicsController < ApplicationController
  def new
    @topic = Topic.new
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

  private

  def topic_params
    params.require(:topic).permit(:title, :description)
  end
end
