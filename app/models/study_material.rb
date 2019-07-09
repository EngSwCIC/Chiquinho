# == Schema Information
#
# Table name: study_materials
#
#  id          :bigint           not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  subject_id  :bigint
#  description :string
#  user_id     :bigint
#

class StudyMaterial < ApplicationRecord
  has_one_attached :file
  has_one :user
  has_one :professor_subject
end
