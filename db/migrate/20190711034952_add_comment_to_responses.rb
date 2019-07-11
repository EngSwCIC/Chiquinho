class AddCommentToResponses < ActiveRecord::Migration[5.2]
  def change
    add_reference :responses, :comment, foreign_key: true
  end
end
