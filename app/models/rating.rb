# == Schema Information
#
# Table name: ratings
#
#  id         :bigint           not null, primary key
#  subject_id :bigint
#  trabalhos  :integer
#  provas     :integer
#  tarefas    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rating < ApplicationRecord
  belongs_to :subject
end
