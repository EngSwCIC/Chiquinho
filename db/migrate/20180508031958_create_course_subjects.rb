class CreateCourseSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :course_subjects do |t|
      t.references :subject, foreign_key: true
      t.references :course, foreign_key: true
      t.integer :kind

      t.timestamps
    end
  end
end
