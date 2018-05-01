class Subject < ApplicationRecord
  has_and_belongs_to_many :schedules
end
