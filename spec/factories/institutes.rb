FactoryBot.define do
  factory :institute do
    name { Faker::Name.name }
    address { Faker::Address.street_name }
    city { Faker::Address.city }
    neighborhood { Faker::Address.secondary_address }
    phone { }
    geocode { "POINT(#{Faker::Address.latitude} #{Faker::Address.longitude})" }
  end
end
