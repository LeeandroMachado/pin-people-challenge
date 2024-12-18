FactoryBot.define do
  factory :city do
    name { Faker::Lorem.sentence(word_count: 3) }
  end
end
