# Controller to study materials

class StudyMaterialsController < ApplicationController
  before_action :authenticate_user!
  
  # POST page to receive form data of creation
  def create
    @studyMaterial = current_user.study_materials.new(study_material_params)
    if @studyMaterial.save
      redirect_to subject_path(id: @studyMaterial.subject_id)
    else
      redirect_to request.referrer
    end
  end

  # Page to create a new entry of study material
  def new
    @studyMaterial = StudyMaterial.new
    @subject_id = params[:subject_id]
  end

  private
    def study_material_params
      params.require(:study_material).permit(:name, :file, :subject_id, :description)
    end
end
