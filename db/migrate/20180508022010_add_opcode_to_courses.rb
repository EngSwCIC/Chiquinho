class AddOpcodeToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :opcode, :integer
  end
end
