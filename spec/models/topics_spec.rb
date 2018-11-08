require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:course) { FactoryBot.create(:course)}
  let(:topic) { Topic.new(title: 'um titulo teste', description: 'uma descricao teste', course: course) }

  it { expect(topic).to belong_to(:course) }

  context 'when params are valid' do
    it 'topic valid' do
      expect(topic).to be_valid
    end
  end

end