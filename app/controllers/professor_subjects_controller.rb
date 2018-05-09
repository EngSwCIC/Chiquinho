class ProfessorSubjectsController < ApplicationController
  def show
    @comments = Comment.all
    @professor = Professor.find(params[:id])
    @subject = Subject.find(params[:subject_id])
    @professor_subject = ProfessorSubject.where(professor_id: @professor.id).find_by(subject_id: @subject.id)
    #@comment = Comment.new(professor_subject_id: @professor_subject.id)
  end
end
