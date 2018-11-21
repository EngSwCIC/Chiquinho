class CreateClassHours < ActiveRecord::Migration[5.2]
  def change
    create_table :class_hours do |t|
      t.time :hour
    end
  end
end
