class AddUserToTopics < ActiveRecord::Migration[5.2]
  def change
    add_reference :topics, :user, foreign_key: true
  end
end
