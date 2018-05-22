class AddSubjectToStudyMaterials < ActiveRecord::Migration[5.2]
  def change
    add_reference :study_materials, :subject, foreign_key: true
  end
end
