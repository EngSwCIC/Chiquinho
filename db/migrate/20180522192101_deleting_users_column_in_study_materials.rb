class DeletingUsersColumnInStudyMaterials < ActiveRecord::Migration[5.2]
  def change
    remove_column :study_materials, :users_id
  end
end
