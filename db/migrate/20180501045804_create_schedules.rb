class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :time_8, array:true, default: []
      t.string :time_10, array:true, default: []
      t.string :time_12, array:true, default: []
      t.string :time_14, array:true, default: []
      t.string :time_16, array:true, default: []
      t.string :time_19, array:true, default: []
      t.string :time_21, array:true, default: []
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
