class AddUserToStudyMaterials < ActiveRecord::Migration[5.2]
  def change
    add_reference :study_materials, :user, foreign_key: true
  end
end
