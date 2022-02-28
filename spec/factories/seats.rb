FactoryBot.define do
  factory :seat do
    name { Faker::Lorem.word }
    top {Faker::Number.number(digits: 3)}
    left {Faker::Number.number(digits: 3)}
    right {Faker::Number.number(digits: 3)}
    bottom {Faker::Number.number(digits: 3)}
    room_id { nil }
  end
end
