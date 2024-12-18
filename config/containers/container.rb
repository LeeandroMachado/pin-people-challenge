require_relative "./datasets_container"
require_relative "./employees_container"
require_relative "./organization_structures_container"
require_relative "./positions_functions_areas_container"
require_relative "./survey_responses_container"

class Container
  extend Dry::Container::Mixin

  merge(DatasetsContainer)
  merge(EmployeesContainer)
  merge(OrganizationStructuresContainer)
  merge(PositionsFunctionsAreasContainer)
  merge(SurveyResponsesContainer)
end

Import = Dry::AutoInject(Container)
