FactoryBot.define do
    factory :topic do
        title "Um tópico nem tão legal"
        description "Uma descrição nem tão legal"
        association :course, factory: :course
        association :professor, factory: :professor
        association :subject, factory: :subject
        association :user, factory: :user
    end
end
