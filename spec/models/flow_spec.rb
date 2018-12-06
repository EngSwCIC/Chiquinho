require 'rails_helper'

RSpec.describe Flow, type: :model do

  context "when params are valid" do

    before(:each) {
      @course = FactoryBot.create(:course)
      @subject = FactoryBot.create(:subject)
      @subject2 = FactoryBot.create(:subject)
      @flow = Flow.create(subject: @subject, course: @course, semester: 6)
      @flow2 = Flow.create(subject: @subject2, course: @course, semester: 6)
    }

    it 'has correct relationships' do
      expect(@flow).to belong_to(:subject)
      expect(@flow).to belong_to(:course)
    end

    it 'gets all semesters correctly' do
      semesters = Flow.get_semesters(@course)
      expect(semesters).to eq [nil,nil,nil,nil,nil,[@subject, @subject2]]
    end

  end

  context "when params are invalid" do
    before(:each) {
      @course = FactoryBot.create(:course)
      @subject = FactoryBot.create(:subject)
      @subject2 = FactoryBot.create(:subject)
      @flow = Flow.create(subject: @subject, course: @course, semester: 6)
      @flow2 = Flow.create(subject: @subject2, course: @course, semester: 6)
    }

    it "returns nil for nil parameter" do
      semesters = Flow.get_semesters(nil)
      expect(semesters).to eq nil
    end

    it "returns nil for a subject parameter" do
      semesters = Flow.get_semesters(@subject)
      expect(semesters).to eq nil
    end
  end

end
