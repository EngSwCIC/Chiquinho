FactoryBot.define do
    factory :user do
        email 'diogo@email.com'
        first_name 'Diogo'
        last_name 'Queiroz'
        matricula '15/0123418'
        password '12345678'
        password_confirmation '12345678'
        course
    end
end
