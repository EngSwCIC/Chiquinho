FactoryBot.define do
    factory :user do
        email Faker::Internet.email
        first_name Faker::Name.unique.name
        last_name Faker::Name.unique.name
        matricula '15/0123418'
        password '12345678'
        password_confirmation '12345678'
        course
    end
end
