module Employees
  class BuildEmployeeService < ::BuildService
    include Import[
      "organization_structures.build_organization_structure_service",
      "positions_functions_areas.build_positions_functions_area_service",
      "survey_responses.build_survey_response_service"
    ]

    private

    def build
      organization_structure = build_organization_structure_service.call(row, caches)
      positions_functions_area = build_positions_functions_area_service.call(row, caches)
      city = cache_and_find(:cities, row[:localidade].titleize, City)
      employee = find_or_build_employee(positions_functions_area, organization_structure, city)
      employee.survey_responses << build_survey_response_service.call(row, caches, employee)

      employee
    end

    def find_or_build_employee(positions_functions_area, organization_structure, city)
      caches[:employees][row[:email]] ||= Employee.find_or_initialize_by(email: row[:email]).tap do |employee|
        employee.assign_attributes(
          name: row[:nome],
          corporate_email: row[:email_corporativo],
          positions_functions_area_id: positions_functions_area.id,
          organization_structure_id: organization_structure.id,
          gender: row[:genero],
          generation: row[:geracao],
          city_id: city.id,
          tenure: row[:tempo_de_empresa]
        )
      end
    end
  end
end
