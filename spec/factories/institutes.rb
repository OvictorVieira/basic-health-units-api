FactoryBot.define do
  factory :institute do
    name { Faker::Name.name }
    address { Faker::Address.street_name }
    city { Faker::Address.city }
    phone { }
    lat { Faker::Address.latitude }
    long { Faker::Address.longitude }
  end
end
