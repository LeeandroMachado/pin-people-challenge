require "rails_helper"

RSpec.describe SurveyResponse, type: :model do
  describe "validations" do
    subject(:survey_response) { build(:survey_response) }

    context "when all attributes are valid" do
      it { is_expected.to be_valid }
    end

    context "when interest_in_position is missing" do
      before { survey_response.interest_in_position = nil }

      it "includes error message" do
        is_expected.to be_invalid
        expect(
          survey_response.errors[:interest_in_position]
        ).to include("can't be blank")
      end
    end
  end
end
