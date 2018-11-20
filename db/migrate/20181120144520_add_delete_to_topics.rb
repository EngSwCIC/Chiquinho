class AddDeleteToTopics < ActiveRecord::Migration[5.2]
  def change
    
    add_column :topics, :deleted, :boolean, :default => false
  end
end
