FactoryBot.define do
  factory :directorate do
    name { Faker::Lorem.sentence(word_count: 3) }
  end
end
