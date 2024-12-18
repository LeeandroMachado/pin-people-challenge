json.data @employees do |employee|
  json.partial! "employees/employee", employee: employee
end

json.meta do
  json.current_page @employees.current_page
  json.total_pages @employees.total_pages
  json.total_count @employees.count
end
