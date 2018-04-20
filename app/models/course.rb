class Course < ApplicationRecord
  enum classification: [ :exatas, :humanas ]
end
