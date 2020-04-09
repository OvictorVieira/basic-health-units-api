FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email {}
    password { 'password' }
    password_confirmation { 'password' }
  end
end
