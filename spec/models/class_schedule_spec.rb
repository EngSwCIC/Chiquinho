require 'rails_helper'

RSpec.describe ClassSchedule, type: :model do
  describe "Create and update class schedule" do

    context "with valid params" do
      let(:subject_class) { FactoryBot.create(:subject_class)}

      before do
        week_day = WeekDay.create(day: "Segunda")
        class_hour = ClassHour.create(hour: "10:00")

        @params = {subject_class_id: subject_class.id,
                   week_day_id: week_day.id,
                   class_hour_id: class_hour.id}
      end

      it "create a class schedule" do
        expect(ClassSchedule.create(@params)).to be_valid
      end

      it "update an existent class schedule" do
        class_schedule = ClassSchedule.create(@params)
        new_class_hour = ClassHour.create(hour: "12:00")

        class_schedule.class_hour_id = new_class_hour.id
        class_schedule.save!

        expect(class_schedule.class_hour).to eq(new_class_hour)
      end
    end

  end
end