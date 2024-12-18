class EmployeesContainer
  extend Dry::Container::Mixin

  register "employees.build_employee_service" do
    Employees::BuildEmployeeService.new
  end

  register "employees.index_employees_service" do
    Employees::IndexEmployeeService.new
  end
end
