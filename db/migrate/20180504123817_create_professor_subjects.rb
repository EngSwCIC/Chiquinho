class CreateProfessorSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :professor_subjects do |t|
      t.references :professor, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
