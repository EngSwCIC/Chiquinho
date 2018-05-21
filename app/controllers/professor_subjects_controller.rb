class ProfessorSubjectsController < ApplicationController
  def show
    @professor = Professor.find(params[:id])
    @subject = Subject.find(params[:subject_id])
    @professor_subject = ProfessorSubject.where(professor_id: @professor.id).find_by(subject_id: @subject.id)
    @comments = @professor_subject.comments
  end
end
