# == Schema Information
#
# Table name: schedules_subjects
#
#  subject_id  :bigint           not null
#  schedule_id :bigint           not null
#  id          :bigint           not null, primary key
#

class ScheduleSubject < ApplicationRecord
  self.table_name = 'schedules_subjects'

  belongs_to :subject
  belongs_to :schedule
end
