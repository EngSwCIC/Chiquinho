class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :kind
      t.integer :code
      t.string :name
      t.string :turn
      t.integer :classification,default: 0
      
      t.timestamps
    end
  end
end
