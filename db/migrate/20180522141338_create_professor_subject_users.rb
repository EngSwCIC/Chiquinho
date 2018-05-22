class CreateProfessorSubjectUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :professor_subject_users do |t|
      t.references :user, foreign_key: true
      t.references :professor_subject, foreign_key: true
      t.integer :trabalhos
      t.integer :provas
      t.integer :tarefas

      t.timestamps
    end
  end
end
