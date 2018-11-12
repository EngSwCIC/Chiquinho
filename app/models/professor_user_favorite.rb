class ProfessorUserFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :professor
end
