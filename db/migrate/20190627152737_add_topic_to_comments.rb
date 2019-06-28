class AddTopicToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :topic, foreign_key: true
  end
end
