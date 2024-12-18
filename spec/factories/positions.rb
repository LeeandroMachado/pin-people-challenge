FactoryBot.define do
  factory :position do
    name { Faker::Lorem.sentence(word_count: 3) }
  end
end
