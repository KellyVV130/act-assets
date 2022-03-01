FactoryBot.define do
  factory :group do
    name { Faker::Lorem.word }
    dn { Faker::Lorem.word }
  end
end