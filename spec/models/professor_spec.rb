require 'rails_helper'

RSpec.describe Professor, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  context "with correct attributtes" do
    let(:professor){ FactoryBot.create(:professor) }
    it "should be valid" do
      expect(professor).to be_valid
    end

    it "should update with valid params" do
      professor.name = "Mauro"
      expect(professor).to be_valid
    end
  end

  context "with incorrect attributtes" do
    let(:professor){ Professor.new }
    it "should be invalid" do
      expect(professor).not_to be_valid
    end

    it "should not update with invalid params" do
      professor.name = ""
      expect(professor).not_to be_valid
    end
  end

end
