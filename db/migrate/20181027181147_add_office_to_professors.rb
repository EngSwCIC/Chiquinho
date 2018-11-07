class AddOfficeToProfessors < ActiveRecord::Migration[5.2]
  def change
    add_column :professors, :office, :string
  end
end
