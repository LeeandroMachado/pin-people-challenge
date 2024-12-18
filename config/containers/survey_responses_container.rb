class SurveyResponsesContainer
  extend Dry::Container::Mixin

  register "survey_responses.build_survey_response_service" do
    SurveyResponses::BuildSurveyResponseService.new
  end
end
