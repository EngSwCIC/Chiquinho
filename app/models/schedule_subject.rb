class ScheduleSubject < ApplicationRecord
  self.table_name = 'schedules_subjects'

  belongs_to :subject
  belongs_to :schedule
end
