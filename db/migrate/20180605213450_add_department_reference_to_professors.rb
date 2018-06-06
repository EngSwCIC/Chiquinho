class AddDepartmentReferenceToProfessors < ActiveRecord::Migration[5.2]
  def change
    add_reference :professors, :departments, foreign_key: true
  end
end
