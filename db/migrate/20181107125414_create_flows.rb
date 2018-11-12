class CreateFlows < ActiveRecord::Migration[5.2]
  def change
    create_table :flows do |t|
      t.references :subject, foreign_key: true
      t.references :course, foreign_key: true
      t.integer :semester

      t.timestamps
    end
  end
end
