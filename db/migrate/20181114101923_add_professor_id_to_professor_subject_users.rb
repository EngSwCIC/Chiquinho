class AddProfessorIdToProfessorSubjectUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :professor_subject_users, :professor_id, :bigint
    add_foreign_key :professor_subject_users, :professors, column: :professor_id
  end
end
