class AddStudyMaterialDescription < ActiveRecord::Migration[5.2]
  def change
    add_column :study_materials, :description, :string
  end
end
