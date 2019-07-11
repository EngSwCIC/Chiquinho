class AddUserToResponses < ActiveRecord::Migration[5.2]
  def change
    add_reference :responses, :user, foreign_key: true
  end
end
