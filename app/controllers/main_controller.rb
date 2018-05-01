class MainController < ApplicationController
  before_action :require_current_user,only: [:update_user_schedule]
  # skip_before_action :verify_authenticity_token, only: [:update_user_schedule]

  def index
    @users = User.all
    @courses = Course.all
  end

  def update_user_schedule
    current_user.schedule ||= Schedule.new
    puts params[:name]

    respond_to do |format|
      format.html
      format.js { @subject = "ola" }
      format.json
    end
  end

  private

  def require_current_user
    if current_user.nil?
      flash[:danger] = "Apenas próprio usuário tem acesso à isso."
      redirect_to root_path
    end
  end
end
