class ForumsController < ApplicationController
  def show
    @forum = Forum.find_by(course_id: params[:course_id])
  end
end
