class Topic < ApplicationRecord
  belongs_to :course, required: false
  belongs_to :professor, required: false
  belongs_to :subject, required: false
  belongs_to :topic, required: false
  belongs_to :user, required: true
end
