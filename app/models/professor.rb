# Class to model a university professor.
#
# == Attributes
# * +Name+ - The full name of the professor.
# * +Office+ - The location of the professor's office in the university.
#

class Professor < ApplicationRecord
  has_one :course
  has_many :professor_subjects
  has_many :subjects, through: :professor_subjects
  has_many :professor_user_favorites
  has_many :users, through: :professor_user_favorites
  has_many :subject_classes
  belongs_to :department, required: false

  # Computes the professor's score based on all reviews
  #
  # ==== Returns
  #
  # Returns an average of all reviews (trabalhos/tarefas/provas) of a professor
  #
  def score
    @reviews = ProfessorSubjectUser.where(professor_id: self.id)
    @score = @reviews.map{|x| x.sumscore}.sum
    @score == 0 ? 0 : @score/@reviews.count;
  end

  # Computes the number of likes professor got
  def count_favorite
    ProfessorUserFavorite.where(professor_id: self.id).count
  end
end
