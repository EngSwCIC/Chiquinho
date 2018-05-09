class AddProfessorSubjectToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :professor_subject, foreign_key: true
  end
end
