require_relative '../views/order_view'
require_relative '../views/meal_view'
require_relative '../views/customers_view'
require_relative '../views/employee_view'
require_relative '../models/order'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @meal_view = MealView.new
    @customer_view = CustomerView.new
    @order_view = OrderView.new
    @employee_view = EmployeeView.new
  end

  def add
    # 1.0 GET ALL MEALS
    meals = @meal_repository.all
    # 1.1 DISPLAY ALL MEALS
    @meal_view.display_meals(meals)
    # 1. Ask for which meal to add
    meal_id = @order_view.ask_for('ID').to_i
    # 2. Retrieve the right meal
    meal = @meal_repository.find(meal_id)
    p meal

    # 1.0 GET ALL customers
    customers = @customer_repository.all
    # 1.1 DISPLAY ALL customers
    @customer_view.display_customers(customers)
    # 1. Ask for which customer to add
    customer_id = @order_view.ask_for('ID').to_i
    # 2. Retrieve the right customer
    customer = @customer_repository.find(customer_id)
    p customer

    # 1.0 GET ALL THE RIDERS
    riders = @employee_repository.all_riders
    # 1.1 DISPLAY ALL RIDERS/EMPLOYEES
    @employee_view.display_employees(riders)
    # 1. Ask for which rider to add
    employee_id = @order_view.ask_for('ID').to_i
    # 2. Retrieve the right rider
    rider = @employee_repository.find(employee_id)
    p rider
    # 7. Instantiate a new ORDER
    new_order = Order.new(meal: meal, customer: customer, employee: rider)
    # 8. Tell the repo to create it!
    @order_repository.create(new_order)
  end

  def mark_as_delivered(user)
    list_my_orders(user)
    # 2. ask which one to mark as delivered
    order_id = @order_view.ask_for('ID').to_i
    # 3.1 retrieve the right order
    order = @order_repository.find(order_id)
    @order_repository.mark_as_delivered(order)
  end

  def list_undelivered_orders
    # 1. GET ALL UNDELIVERED ORDERS
    orders = @order_repository.undelivered_orders
    # 2. DISPLAY THE ORDERS
    @order_view.display_orders(orders)
  end

  def list_my_orders(employee)
    my_orders = @order_repository.my_undelivered_orders(employee)
    # p my_orders
    @order_view.display_orders(my_orders)
  end
end
