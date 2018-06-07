class AddSubjectToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :subject, foreign_key: true
  end
end
