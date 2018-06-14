require 'rails_helper'

RSpec.describe Course, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  context "with correct attributtes" do
    let(:course){ FactoryBot.create(:course) }
    it "should be valid" do
      expect(course).to be_valid
    end

    it "should update with valid kind" do
      course.kind = "Distância"
      expect(course).to be_valid
    end

    it "should update with valid name" do
      course.name = "Fisica"
      expect(course).to be_valid
    end

    it "should update with valid turn" do
      course.turn = "Noturno"
      expect(course).to be_valid
    end

    it "should update with valid code" do
      course.code = 1234
      expect(course).to be_valid
    end

    it "should update with valid opcode" do
      course.opcode = 1234
      expect(course).to be_valid
    end

    it "should update with valid classification" do
      course.classification = "humanas"
      expect(course).to be_valid
    end

  end

  context "with incorrect attributtes" do
    let(:course){ Professor.new }
    it "should be invalid" do
      expect(course).not_to be_valid
    end

    it "should not update with invalid name" do
      course.name = ""
      expect(course).not_to be_valid
    end

  end
end
