class Professor < ApplicationRecord
  has_one :course
  has_many :professor_subjects
  has_many :subjects, through: :professor_subjects
  has_many :professor_user_favorites
  has_many :users, through: :professor_user_favorites
  belongs_to :department, required: false
  
  def score
    @score = 0
    @count = 0
    ProfessorSubjectUser.where(professor_id: self.id).each do |avaliation|
      @score += 
        (avaliation.trabalhos || 0) + 
        (avaliation.provas || 0) + 
        (avaliation.tarefas || 0)
      @count = @count + 1
    end
    @score == 0 ? 0 : @score/3.0/@count;
  end
end
