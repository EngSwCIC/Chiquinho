class Topic < ApplicationRecord
  belongs_to :course, required: false
  belongs_to :professor, required: false
  belongs_to :subject, required: false
end
