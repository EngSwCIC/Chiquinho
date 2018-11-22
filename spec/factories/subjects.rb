FactoryBot.define do
    factory :subject do
        code 116441
        name "ENGENHARIA DE SOFTWARE"
        credits "004 000 000 004"
        area "AC"

        factory :subject_with_classes do
            transient do
                classes_count {5}
            end
            after(:create) do |subject, evaluator|
                create_list(:subject_class, evaluator.classes_count, subject: subject)
                subject.reload
            end
        end
    end
end
