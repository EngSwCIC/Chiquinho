class CreateProfessorUserFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :professor_user_favorites do |t|
      t.integer :professor_id
      t.integer :user_id

      t.timestamps
    end
  end
end
