class AddUserProfessorSubject < ActiveRecord::Migration[5.2]
  def change
    add_reference :study_materials, :professor_subject, foreign_key: true
    add_reference :study_materials, :users, foreign_key: true
  end
end
