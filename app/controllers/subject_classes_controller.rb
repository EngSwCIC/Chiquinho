class SubjectClassesController < ApplicationController

  before_action :require_current_user,only: [:add_class_schedule]

  def show

  end

  def add_class_schedule
    subject_class = SubjectClass.find(params[:id])
    class_schedules = ClassSchedule.where(subject_class_id: params[:id])

    name = subject_class.subject.name

    class_schedules.each do |schedule|
      day = schedule.week_day.id
      time = schedule.class_hour.hour.hour

      if time < 8
        time = 8
      elsif time > 16 && time < 20
        time = 19
      elsif time > 20
        time = 21
      end

      if day == 6
        day = 5
      end

      update_schedule(name, day, time)
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
  end

  private

  def update_schedule(name, day, time)
    current_user.schedule ||= Schedule.new(time_8: Array.new(6),time_10: Array.new(6),time_12: Array.new(6),time_14: Array.new(6),time_16: Array.new(6),time_19: Array.new(6),time_21: Array.new(6))

    mater = Subject.where("unaccent(lower(name)) LIKE ?", "%#{I18n.transliterate(name.downcase)}%")
    mater.each do |mat|
      puts mat.name
    end

    current_user.schedule["time_#{time}"][day.to_i] = mater.first.name
    unless current_user.schedule.subjects.any? {|m| m.name == mater.first.name}
      current_user.schedule.subjects << mater.first
    end

  end

  def require_current_user
    if current_user.nil?
      flash[:danger] = "Apenas próprio usuário tem acesso à isso."
      redirect_to root_path
    end
  end

end
