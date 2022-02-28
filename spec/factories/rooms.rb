FactoryBot.define do
  factory :room do
    name { Faker::Lorem.word }
    coords { Faker::Lorem.word }
  end
end
