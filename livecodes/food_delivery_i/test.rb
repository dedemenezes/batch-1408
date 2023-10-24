require_relative 'app/models/employee'
require_relative 'app/repositories/employee_repository'

rider_one = Employee.new(id: 1, username: 'Jack', password: 'secret', role: 'rider')
# p rider_one


employee_repository = EmployeeRepository.new('./data/employees.csv')
