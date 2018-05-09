class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :professor_subject
  def subject_id=(data)

  end
end
