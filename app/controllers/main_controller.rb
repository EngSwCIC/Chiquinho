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

    current_user.schedule["time_#{params[:time]}"][params[:day].to_i] = params[:name]
    respond_to do |format|
      if current_user.schedule.save
        format.html { redirect_to edit_user_registration_path, notice: "Grade Atualizada."}
        format.js { @subject = "ola" }
        format.json
      else
        format.html { redirect_to edit_user_registration_path, danger: "Erro ao Atualizar."}
        format.js { @subject = "ola" }
        format.json
      end
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
