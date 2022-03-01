FactoryBot.define do
  factory :user do
    name { Faker::Lorem.word }
    email { Faker::Lorem.word}
    group_id {nil}
    supervisor_id { nil }
  end
end
