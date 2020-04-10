FactoryBot.define do
  factory :institute do
    name { Faker::Name.name }
    address { Faker::Address.street_name }
    city { Faker::Address.city }
    neighborhood { Faker::Address.secondary_address }
    phone { }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
