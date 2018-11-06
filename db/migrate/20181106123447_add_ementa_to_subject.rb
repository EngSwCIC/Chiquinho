class AddEmentaToSubject < ActiveRecord::Migration[5.2]
  def change
    add_column :subjects, :ementa, :string
  end
end
