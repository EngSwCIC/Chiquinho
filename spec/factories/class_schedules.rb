FactoryBot.define do
  factory :class_schedule do
    subject_class
    week_day { WeekDay.all.sample }
    class_hour { ClassHour.create(hour: Time.now) }
    initialize_with { new(week_day: week_day,class_hour: class_hour) }
  end
end
