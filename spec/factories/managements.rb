FactoryBot.define do
  factory :management do
    name { Faker::Lorem.sentence(word_count: 3) }
  end
end
