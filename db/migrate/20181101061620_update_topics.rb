class UpdateTopics < ActiveRecord::Migration[5.2]
  def change
    remove_column :topics, :forum_id
    
    add_reference :topics, :course, index: true
    add_foreign_key :topics, :courses

    add_reference :topics, :professor, index: true
    add_foreign_key :topics, :professors

    add_reference :topics, :subject, index: true
    add_foreign_key :topics, :subjects
  end
end
