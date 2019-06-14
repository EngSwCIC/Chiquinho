class ForumsController < ApplicationController
  
  def index
    @courses = Course.all
  end
  
  def show
    @forum = Forum.find(params[:id])
  end
end
