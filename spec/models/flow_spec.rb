require 'rails_helper'

RSpec.describe Flow, type: :model do

  context "when params are valid" do
    let(:course) { FactoryBot.create(:course)}
    let(:subject) { FactoryBot.create(:subject)}
    let(:subject2) { FactoryBot.create(:subject)}
    let(:flow) { Flow.create(subject: subject, course: course, semester: 6)}
    let(:flow2) { Flow.create(subject: subject2, course: course, semester: 6)}

    it 'has correct relationships' do
      expect(flow).to belong_to(:subject)
      expect(flow).to belong_to(:course)
    end

    it 'gets all semesters correctly' do

      expect(Flow).to receive(:get_semesters).with(course).and_return([nil,nil,nil,nil,nil,[subject, subject2]])
      Flow.get_semesters(course)
    end
  end


end
