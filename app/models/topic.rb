# == Schema Information
#
# Table name: topics
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  forum_id    :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Topic < ApplicationRecord
  belongs_to :forum
end
