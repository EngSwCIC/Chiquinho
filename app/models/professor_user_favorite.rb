# Model class to represent relationship between professors and user (favorite list)

class ProfessorUserFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :professor
end
