FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email {}
    cnpj { rand.to_s[2..15] }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
