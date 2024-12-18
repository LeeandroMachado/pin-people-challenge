FactoryBot.define do
  factory :company do
    name { Faker::Lorem.sentence(word_count: 3) }
  end
end
