class EmployeesController < ApplicationController
  def index
    index_employee_service = Container.resolve("employees.index_employees_service")

    @employees = index_employee_service.call(
      { name: permitted_params[:name] },
      permitted_params[:page]
    )
  end

  private

  def permitted_params
    params.permit(:name, :page)
  end
end
