require 'rails_helper'

RSpec.describe ClassSchedule, type: :model do
  #pending "Test if class_schedules.order('week_day_id') really orders"

  before(:each) do
    ["Domingo","Segunda-Feira","Terça-Feira","Quarta-Feira","Quinta-Feira","Sexta-Feira","Sábado"].each do |weekday|
      WeekDay.create(day:weekday)
    end
  end

  it 'in an array can be ordered by weekday' do
    FactoryBot.create_list(:class_schedule, 5)
    ordered = ClassSchedule.all.order("week_day_id")
    last = nil
    ordered.each do |c|
      if last
        expect(c.week_day.id).to be >= last
      end
      last = c.week_day.id
    end
  end
end
