class AddCoursesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :course, foreign_key: true
  end
end
