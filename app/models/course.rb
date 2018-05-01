class Course < ApplicationRecord
  enum classification: [ :exatas, :humanas ]
  has_many :users
  has_and_belongs_to_many :subjects
end
