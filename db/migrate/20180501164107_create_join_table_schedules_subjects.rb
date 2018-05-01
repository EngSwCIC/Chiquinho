class CreateJoinTableSchedulesSubjects < ActiveRecord::Migration[5.2]
  def change
    create_join_table :subjects, :schedules do |t|
      t.index [:subject_id, :schedule_id]
      # t.index [:schedule_id, :subject_id]
    end
  end
end
