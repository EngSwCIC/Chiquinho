class CreateUserLikeComments < ActiveRecord::Migration[5.2]
  def change
    create_table :user_like_comments do |t|
      t.references :user, foreign_key: true
      t.references :comment, foreign_key: true
      t.boolean :like

      t.timestamps
    end
  end
end
