require 'rails_helper'

RSpec.describe Schedule, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:schedule){ Schedule.new }
  it { expect(schedule).to belong_to(:user) } # Testar relacionamento

  context "with a user" do
    let(:user){ FactoryBot.create(:user) }
    it "should be valid" do
      schedule.user = user
      expect(schedule).to be_valid
    end
  end

  context "without a user" do
    it "should not be valid" do
      expect(schedule).not_to be_valid
    end
  end
end
