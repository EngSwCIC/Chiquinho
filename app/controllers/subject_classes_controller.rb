class SubjectClassesController < ApplicationController
  def show
    @subject_class = SubjectClass.find(params[:id])
    @class_schedules = ClassSchedule.where(subject_class_id: params[:id])
  end
end
