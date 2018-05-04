class DestroyJoinTableProfessorSubject < ActiveRecord::Migration[5.2]
  def change
    drop_join_table :professors, :subjects do |t|
      t.index [:professor_id, :subject_id]
    end
  end
end
