class CreateSurveyResponses < ActiveRecord::Migration[7.2]
  def change
    create_table :survey_responses do |t|
      t.references :employee, null: false, foreign_key: true
      t.date :response_date
      t.integer :interest_in_position
      t.text :interest_in_position_comments
      t.integer :contribution
      t.text :contribution_comments
      t.integer :learning_and_development
      t.text :learning_and_development_comments
      t.integer :feedback
      t.text :feedback_comments
      t.integer :manager_interaction
      t.text :manager_interaction_comments
      t.integer :career_clarity
      t.text :career_clarity_comments
      t.integer :permanence_expectation
      t.text :permanence_expectation_comments
      t.integer :enps
      t.text :enps_comments

      t.timestamps
    end

    add_index :survey_responses, [ :employee_id, :response_date ]
  end
end
