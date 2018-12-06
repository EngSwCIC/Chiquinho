FactoryBot.define do
    factory :topic2 do
        title "Uma legenda nem tão legal"
        description "Uma resposta nem tão legal"
        association :user, factory: :user
        association :topic, factory: :topic
    end
end

