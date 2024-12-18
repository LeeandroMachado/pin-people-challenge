FactoryBot.define do
  factory :coordination do
    name { Faker::Lorem.sentence(word_count: 3) }
  end
end
