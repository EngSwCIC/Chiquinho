# Controller to classes of a subject

class SubjectClassesController < ApplicationController

  before_action :require_current_user,only: [:add_class_schedule]

  # Controller show action
  def show
    @subject_class = SubjectClass.find(params[:id])
    @class_schedules = ClassSchedule.where(subject_class_id: params[:id])
  end

  # Adds a class to user schedule, converting it into subject.
  #
  # Because the actual architecture is add subject into schedule, so this function must convert the class
  # to his subject, keeping the subject's hours and week days.
  #
  # For better understanding please compare Schedule and ClassSchedule.
  #
  def add_class_schedule
    subject_class = SubjectClass.find(params[:id])

    if add_subject_class_schedules(subject_class) and current_user.schedule.save
      flash['notice'] = "Grade Atualizada."
    else
      flash['danger'] = "Erro ao Atualizar! Talvez os horários da turma não existam nesta grade!"
    end

    redirect_to user_schedule_path
  end

  private

  # Convert the class into a subject
  def add_subject_class_schedules(subject_class)
    class_schedules = ClassSchedule.where(subject_class_id: params[:id])

    name = subject_class.subject.name

    class_schedules.each do |schedule|
      day = schedule.week_day.id
      time = schedule.class_hour.hour.hour

      begin
        update_schedule(name, day, time)
      rescue
        return false
      end
    end

    true
  end

  # Adds a subject to user and user schedule.
  #
  # This function is an adaptation of MainController#update_user_schedule
  #
  def update_schedule(name, day, time)
    times = %w"time_8 time_10 time_12 time_14 time_16 time_19 time_21"
    current_user.schedule ||= Schedule.new(hash[times.map{|x| [x, Array.new(6)]}])

    subject = Subject.where("unaccent(lower(name)) LIKE ?", "%#{I18n.transliterate(name.downcase)}%").first

    current_user.schedule["time_#{time}"][day] = subject.name

    add_subject_user(subject)
  end

  # Adds a subject to a user
  def add_subject_user(subject)
    unless current_user.schedule.subjects.include? subject
      current_user.schedule.subjects << subject
    end
  end

  # Checks if there's a user logged in
  def require_current_user
    if current_user.nil?
      flash[:danger] = "Apenas próprio usuário tem acesso à isso."
      redirect_to root_path
    end
  end

end
