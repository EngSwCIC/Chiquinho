FactoryBot.define do
  factory :subject_class do
    name { Faker::Types.unique.character }
    subject
    professor

    factory :subject_class_with_schedules do
      transient do
          schedules_count {5}
      end
      after(:create) do |subject_class, evaluator|
          create_list(:class_schedule, evaluator.schedules_count, subject_class: subject_class)
      end
  end
  end
end
