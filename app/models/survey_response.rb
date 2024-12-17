class SurveyResponse < ApplicationRecord
  belongs_to :employee, required: true

  validates :response_date, :interest_in_position, :interest_in_position_comments,
            :contribution, :contribution_comments, :learning_and_development,
            :learning_and_development_comments, :feedback, :feedback_comments,
            :manager_interaction, :manager_interaction_comments, :career_clarity,
            :career_clarity_comments, :permanence_expectation, :permanence_expectation_comments,
            :enps, :enps_comments, presence: true
end
