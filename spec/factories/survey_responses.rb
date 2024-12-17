FactoryBot.define do
  factory :survey_response do
    employee
    response_date { "2024-12-17" }
    interest_in_position { 1 }
    interest_in_position_comments { "MyText" }
    contribution { 1 }
    contribution_comments { "MyText" }
    learning_and_development { 1 }
    learning_and_development_comments { "MyText" }
    feedback { 1 }
    feedback_comments { "MyText" }
    manager_interaction { 1 }
    manager_interaction_comments { "MyText" }
    career_clarity { 1 }
    career_clarity_comments { "MyText" }
    permanence_expectation { 1 }
    permanence_expectation_comments { "MyText" }
    enps { 1 }
    enps_comments { "MyText" }
  end
end
