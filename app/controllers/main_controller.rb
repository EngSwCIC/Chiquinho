class MainController < ApplicationController
  before_action :require_current_user, only: %i[update_user_schedule clean_user_schedule]
  before_action :set_schedule, only: %i[schedule clear_subject clean_user_schedule update_user_schedule]
  # skip_before_action :verify_authenticity_token, only: [:update_user_schedule]

  def index
    @users = User.all
    @courses = Course.all
    @professors = Professor.all
    @subjects = Subject.all
  end

  def schedule; end

  def clear_subject
    @schedule.find_and_remove_subject(params[:name]) if params[:name]

    redirect_to user_schedule_path
  end

  def clean_user_schedule
    @schedule.reset

    flash[:notice] = 'Grade horária apagada.'
    redirect_to user_schedule_path
  end

  def update_user_schedule
    @schedule ||= Schedule.new

    @subjects = Subject.find_by_name(params[:name])

    if @subjects.length == 1
      @schedule.add_subject("time_#{params[:time]}", params[:day].to_i, @subjects.first)
      respond_to do |format|
        if @schedule.save
          format.html { redirect_to user_schedule_path, notice: 'Grade Atualizada.' }
        else
          format.html { redirect_to user_schedule_path, danger: 'Erro ao Atualizar.' }
        end
      end
    elsif @subjects.empty?
      respond_to do |format|
        format.html { redirect_to user_schedule_path, flash: { danger: 'Matéria não encontrada.' } }
      end
    else
      respond_to do |format|
        format.html { redirect_to user_schedule_path, flash: { danger: 'Mais de uma matéria encontrada. Tente especificar mais o nome.' } }
      end
    end
  end

  def search_subject
    @subjects = Subject.joins(:professors)
                       .find_by_name(params[:name])
                       .find_by_professor(params[:professor])
                       .find_by_area(params[:area])
                       .find_by_creditos(params[:creditos])
                       .find_by_code(params[:codigo])
  end

  private

  def set_schedule
    @schedule = current_user.schedule
  end

  def require_current_user
    if current_user.nil?
      flash[:danger] = 'Apenas próprio usuário tem acesso à isso.'
      redirect_to root_path
    end
  end
end
