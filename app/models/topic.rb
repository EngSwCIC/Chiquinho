class Topic < ApplicationRecord
  belongs_to :forum
  belongs_to :user
  has_many :comments, :dependent => :delete_all
end
