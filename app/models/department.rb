# Model to the departments that can have professors and courses of that department

class Department < ApplicationRecord
    has_many :courses
    has_many :professors
end
