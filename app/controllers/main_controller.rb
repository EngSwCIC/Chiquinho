class MainController < ApplicationController
  def index
    @users = User.all
  end
end
