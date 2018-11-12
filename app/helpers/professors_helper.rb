module ProfessorsHelper
  def is_favorite?(professor_id, current_user_id)
    favorite = ProfessorUserFavorite.where('professor_id = ? and  user_id = ?', professor_id,  current_user_id)
    !favorite.empty?
  end
end
