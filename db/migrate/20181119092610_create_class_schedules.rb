class CreateClassSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :class_schedules do |t|
      t.references :class, foreign_key: true
      t.references :week_day, foreign_key: true
      t.references :class_hour, foreign_key: true
    end
  end
end
