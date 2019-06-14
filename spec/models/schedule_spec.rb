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

  context "given that the user tried to remove a subject from his schedule" do
    let(:user){ FactoryBot.create(:user) }
    let(:subject){ FactoryBot.create(:subject) }

    before do
      schedule = Schedule.new(
        time_8: Array.new(6),
        time_10: Array.new(6),
        time_12: Array.new(6),
        time_14: Array.new(6),
        time_16: Array.new(6),
        time_19: Array.new(6),
        time_21: Array.new(6)
      )
      schedule.user = user
      schedule.time_8 << subject.name
      ScheduleSubject.create(subject: subject, schedule: schedule)
      schedule.save!
    end
    it "should be deleted" do
      user.schedule.find_and_remove_subject(subject.name)
      byebug
      expect(user.schedule.time_8).to eq([nil, nil, nil, nil, nil, nil, nil])
    end
  end
end
