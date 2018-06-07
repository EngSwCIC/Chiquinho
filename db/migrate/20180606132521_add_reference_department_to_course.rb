class AddReferenceDepartmentToCourse < ActiveRecord::Migration[5.2]
  def change
    add_reference :courses, :departments, foreign_key: true
  end
end
