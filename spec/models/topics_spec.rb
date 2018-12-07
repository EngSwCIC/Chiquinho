require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:course) { FactoryBot.create(:course)}
  let(:user) { FactoryBot.create(:user)}
  #let(:topic) { Topic.new(title: 'um titulo teste', description: 'uma descricao teste', course: course, user: user) }

#  it { expect(topic).to belong_to(:course) }

  context 'when params are valid' do
  	before do
  		@topic = Topic.new(title: 'um titulo teste', description: 'uma descricao teste', course: course, user: user)
  	end
    it 'topic valid' do
      expect(@topic).to be_valid
      expect(@topic).to belong_to(:user)
      expect(@topic).to belong_to(:course)
    end
  end
  context 'when params topic has no user' do
  	before do
  		@topic = Topic.new(title: 'um titulo teste', description: 'uma descricao teste', course: course)
  	end
    it 'topic valid' do
      expect(@topic).to_not be_valid
    end
  end

end