class AddPrimaryKeyToSchedulesSubjects < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules_subjects, :id, :primary_key
  end
end
