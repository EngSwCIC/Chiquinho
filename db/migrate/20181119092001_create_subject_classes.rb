class CreateSubjectClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :subject_classes do |t|
      t.string :name
      t.references :subject, foreign_key: true
      t.references :professor, foreign_key: true
    end
  end
end
