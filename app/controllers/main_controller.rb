class MainController < ApplicationController
  def index
    @users = User.all
    @courses = Course.all
  end
end
