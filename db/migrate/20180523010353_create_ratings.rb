class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.references :subject, foreign_key: true
      t.integer :trabalhos
      t.integer :provas
      t.integer :tarefas

      t.timestamps
    end
  end
end
