# Model class to represent relationship between professors and user (favorite list)
# == Attributes
# * +professor_id+ - professor foreign key
# * +user_id+ - user foreign key
#

class ProfessorUserFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :professor
end
