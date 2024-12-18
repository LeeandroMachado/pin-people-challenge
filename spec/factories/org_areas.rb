FactoryBot.define do
  factory :org_area do
    name { Faker::Lorem.sentence(word_count: 3) }
  end
end
