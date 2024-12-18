class EmployeesController < ApplicationController
  def index
    index_employees_service = Container.resolve("employees.index_employees_service")
    employees = index_employees_service.call(params.permit(:name).to_h)

    render json: employees.as_json(
      include: {
        organization_structure: {
          only: [],
          methods: [ :company_name, :directorate_name, :management_name, :coordination_name, :org_area_name ]
        },
        positions_functions_area: {
          only: [],
          methods: [ :position_name, :function_name, :functional_area_name ]
        },
        city: {
          only: [ :name ]
        }
      }
    )
  end
end
