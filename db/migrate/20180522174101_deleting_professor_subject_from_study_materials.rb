class DeletingProfessorSubjectFromStudyMaterials < ActiveRecord::Migration[5.2]
  def change
    remove_column :study_materials, :professor_subject_id
  end
end
