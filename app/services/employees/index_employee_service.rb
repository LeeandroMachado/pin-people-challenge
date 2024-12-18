module Employees
  class IndexEmployeeService
    def call(filters, page = 1)
      get_filtered_employees(filters).paginate(page: page)
    end

    private

    def get_filtered_employees(filters)
      return Employee.includes(
        organization_structure: [ :company, :directorate, :management, :coordination, :org_area ],
        positions_functions_area: [ :position, :function, :functional_area ],
        city: []
      ).where("employees.name LIKE ?", "%#{filters[:name]}%") if filters[:name].present?

      Employee.all
    end
  end
end
