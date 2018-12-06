# Controller to professors that teach that subject

class ProfessorSubjectsController < ApplicationController
  before_action :require_user,only: [:update_user_professor_subject_rating]

  # Show professor page related to that subject
  def show
    @professor = Professor.find(params[:id])
    @subject = Subject.find(params[:subject_id])
    @professor_subject = ProfessorSubject.find_by(professor_id: @professor.id, subject_id: @subject.id)
    @comments = @professor_subject.comments
    if user_signed_in?
      @rating = ProfessorSubjectUser.find_by(user_id: current_user.id, professor_subject_id: @professor_subject.id)
    else
      @rating = false
    end
    #@comment = Comment.new(professor_subject_id: @professor_subject.id)
  end

  # Update professor rating based on new user trabalhos/tarefas/provas review
  def update_user_professor_subject_rating
    @rating = ProfessorSubjectUser.where(user_id: current_user.id).find_or_create_by(professor_subject_id: params[:professor_subject_id])
    @rating.professor_id = params[:professor_id]
    if params[:trabalhos]
      @rating.trabalhos = params[:trabalhos]
    end
    if params[:provas]
      @rating.provas = params[:provas]
    end
    if params[:tarefas]
      @rating.tarefas = params[:tarefas]
    end
    respond_to do |format|
      if @rating.save
        format.js
        format.html { flash[:success] = "Avaliação atualizada." }
      else
        format.html { flash[:danger] = "Avaliação não atualizada." }
      end
    end
  end

  # Requires a session
  def require_user
    if current_user.nil?
      flash[:danger] = "Autentique-se para avaliar."
      redirect_to new_user_session_path
    end
  end
end
