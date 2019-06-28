class Topic < ApplicationRecord
  belongs_to :forum
  belongs_to :user
  has_many :comments
end
