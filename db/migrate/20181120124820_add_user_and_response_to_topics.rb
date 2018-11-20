class AddUserAndResponseToTopics < ActiveRecord::Migration[5.2]
  def change
    
    add_reference :topics, :user, index: true
    add_foreign_key :topics, :users

    add_reference :topics, :topic, index: true
    add_foreign_key :topics, :topics
  end
end
