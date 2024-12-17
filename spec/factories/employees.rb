FactoryBot.define do
  factory :employee do
    name { "MyString" }
    email { "MyString" }
    corporate_email { "MyString" }
    positions_functions_area
    organization_structure
    gender { 1 }
    generation { 1 }
    city
    tenure { "1 a 2 anos" }
  end

  trait :with_survey_response do
    after(:create) do |employee|
      employee.survey_responses << create(:survey_response, employee: employee)
    end
  end
end
