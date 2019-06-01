class ForumsController < ApplicationController
  def show
    @forum = Forum.find(params[:id])
  end
end
