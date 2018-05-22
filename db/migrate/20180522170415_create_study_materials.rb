class CreateStudyMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :study_materials do |t|
      t.string :nome

      t.timestamps
    end
  end
end
