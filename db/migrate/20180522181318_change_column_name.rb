class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :study_materials, :nome, :name
  end
end
