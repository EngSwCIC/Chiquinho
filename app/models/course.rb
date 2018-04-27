class Course < ApplicationRecord
  enum classification: [ :exatas, :humanas ]
  has_many :users
end
