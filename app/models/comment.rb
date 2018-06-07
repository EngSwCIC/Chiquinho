class Comment < ApplicationRecord
  belongs_to :user
  has_one :professor_subject
  has_one :subject
  def subject_id=(data)

  end
end
