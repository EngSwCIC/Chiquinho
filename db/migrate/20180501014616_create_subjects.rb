class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.integer :code
      t.string :name
      t.string :credits
      t.string :area

      t.timestamps
    end
  end
end
