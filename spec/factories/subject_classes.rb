FactoryBot.define do
  factory :subject_class do
    name          "A"
    association   :subject
    association   :professor
  end
end
