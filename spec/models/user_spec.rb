require 'rails_helper'

RSpec.describe User, type: :model do
  context "with correct attributtes" do
    let(:user){ FactoryBot.create(:user) }
    it "should be valid" do
      expect(user).to be_valid
    end

    it "should update with valid params" do
      user.matricula = "15/0019343"
      expect(user).to be_valid
    end
  end

  context "with incorrect attributtes" do
    let(:user){ User.new }
    it "should be invalid" do
      expect(user).not_to be_valid
    end

    it "should not update with invalid params" do
      user.matricula = "919"
      expect(user).not_to be_valid
    end
  end
end
