# frozen_string_literal: true

require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'

require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/employee_repository'
require_relative 'app/repositories/order_repository'

require_relative 'app/controllers/customers_controller'
require_relative 'app/controllers/sessions_controller'
require_relative 'app/controllers/orders_controller'

require_relative 'router'
meals_csv_file = './data/meals.csv'

customers_csv_file = './data/customers.csv'

meals_repo = MealRepository.new(meals_csv_file)

meals_controller = MealsController.new(meals_repo)

customer_repo = CustomerRepository.new(customers_csv_file)

employee_csv_file_path = './data/employees.csv'
customers_controller = CustomersController.new(customer_repo)

employee_repo = EmployeeRepository.new(employee_csv_file_path)
sessions_controller = SessionsController.new(employee_repo)

order_csv_file_path = './data/orders.csv'

order_repo = OrderRepository.new(order_csv_file_path, meals_repo, customer_repo, employee_repo)
orders_controller = OrdersController.new(meals_repo, customer_repo, employee_repo, order_repo)

router = Router.new(meals_controller, customers_controller, sessions_controller, orders_controller)

router.run
