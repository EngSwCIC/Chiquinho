class Course < ApplicationRecord
  before_create :create_forum
  enum classification: [ :exatas, :humanas ]
  has_many :users
  has_many :course_subjects
  has_many :subjects,through: :course_subjects
  has_one :forum
  has_one :professor
  belongs_to :department, required: false

  validates :name, presence: true, allow_blank: false
  validates_format_of :code, with: /^\d{4}$/, :multiline => true
  validates_format_of :opcode, with: /^\d{4}$/, :multiline => true
  validates_format_of :turn, with: /\A(Diurno|Noturno)\Z/
  validates_format_of :kind, with: /\A(Presencial|Distância)\Z/
  private

  def create_forum
    self.forum = Forum.new
  end
end
