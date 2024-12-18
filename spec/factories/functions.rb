FactoryBot.define do
  factory :function do
    name { Faker::Lorem.sentence(word_count: 3) }
  end
end
