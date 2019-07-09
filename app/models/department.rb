# == Schema Information
#
# Table name: departments
#
#  id         :bigint           not null, primary key
#  name       :string
#  code       :string
#  initial    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Department < ApplicationRecord
    has_many :courses
    has_many :professors
end
