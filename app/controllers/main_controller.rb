class MainController < ApplicationController
  before_action :require_current_user,only: [:update_user_schedule,:clean_user_schedule]
  # skip_before_action :verify_authenticity_token, only: [:update_user_schedule]
  require 'i18n'

  def index
    @users = User.all
    @courses = Course.all
    @professors = Professor.all
    @subjects = Subject.all
  end

  def schedule
    @grade = current_user.schedule
  end
  def clean_user_schedule
    current_user.schedule.delete
    current_user.schedule = Schedule.new(time_8: Array.new(6),time_10: Array.new(6),time_12: Array.new(6),time_14: Array.new(6),time_16: Array.new(6),time_19: Array.new(6),time_21: Array.new(6))

    flash[:notice] = "Grade horária apagada."
    redirect_to user_schedule_path
  end

  def update_user_schedule
    current_user.schedule ||= Schedule.new(time_8: Array.new(6),time_10: Array.new(6),time_12: Array.new(6),time_14: Array.new(6),time_16: Array.new(6),time_19: Array.new(6),time_21: Array.new(6))

    mater = Subject.where("unaccent(lower(name)) LIKE ?", "%#{I18n.transliterate(params[:name].downcase)}%")
    mater.each do |mat|
      puts mat.name
    end
    if mater.length == 1
      current_user.schedule["time_#{params[:time]}"][params[:day].to_i] = mater.first.name
      if !(current_user.schedule.subjects.any?{ |m| m.name == mater.first.name })
        current_user.schedule.subjects << mater.first
      end
      respond_to do |format|
        if current_user.schedule.save
          format.html { redirect_to user_schedule_path, notice: "Grade Atualizada."}
          format.js { @subject = "ola" }
          format.json
        else
          format.html { redirect_to user_schedule_path, danger: "Erro ao Atualizar."}
          format.js { @subject = "ola" }
          format.json
        end
      end
    else
      if mater.length == 0
        respond_to do |format|
          format.html { redirect_to user_schedule_path,flash: {danger: "Matéria não encontrada."} }
        end
      else
        respond_to do |format|
          format.html { redirect_to user_schedule_path,flash: {danger: "Mais de uma matéria encontrada. Tente especificar mais o nome."} }
        end
      end
    end
  end

  def search_subject
    puts "CODIGO"
    puts params[:code]
    @subjects = Subject.joins(:professors).where("subjects.name LIKE '%" + params[:name].upcase + "%' AND professors.name LIKE '%" + params[:professor].upcase + "%' AND subjects.area LIKE '%" + params[:area].upcase + "%' AND subjects.code = " + params[:code])
                                                                                                                                                                                                                                                                                                                                                                                                                                                  
  end

  private

  def require_current_user
    if current_user.nil?
      flash[:danger] = "Apenas próprio usuário tem acesso à isso."
      redirect_to root_path
    end
  end
end
