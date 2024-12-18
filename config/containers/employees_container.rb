class EmployeesContainer
  extend Dry::Container::Mixin

  register "employees.build_employee_service" do
    Employees::BuildEmployeeService.new
  end
end
