class ProfessorUserFavorite < ApplicationRecord
  has_many :users
  has_many :professors
end
