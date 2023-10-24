require 'csv'

class OrderRepository
  def initialize(csv_file_path, meal_repository, customer_repository, employee_repository)
    @csv_file_path = csv_file_path
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders = []
    @next_id = 1
    load_csv if File.exist?(csv_file_path)
  end

  def undelivered_orders
    # SHOULD RETURN AN ARRAY OF ORDERS UNDELIVERED
    @orders.reject do |order|
      order.delivered? # THIS CONDITION IS TRUE
    end
  end

  def find(order_id)
    @orders.find { |order| order.id == order_id }
  end

  # SINGLE RESPONSABILITY PRINCIPLE
  def my_undelivered_orders(employee)
    # 1. get all the undelivered orders
    orders = undelivered_orders
    # p orders
    # 2. Filter by the logged in user
    orders.select do |order|
      order.employee == employee
    end
  end

  def create(order_instance)
    order_instance.id = @next_id
    @next_id += 1
    @orders << order_instance
    save_csv
  end

  def mark_as_delivered(order)
    # 3. mark as delivered
    order.deliver!
    # 4. save it to the csv
    save_csv
  end

  private

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << [:id, :meal_id, :customer_id, :employee_id, :delivered]
      @orders.each do |order|
        csv << [order.id, order.meal.id, order.customer.id, order.employee.id, order.delivered?]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      # p row #=> #<CSV::Row "id":"3" "delivered":"true" "meal_id":"2" "customer_id":"3" "employee_id":"2">
      # 1. convert the values to the right data type
      row[:id] = row[:id].to_i
      row[:delivered] = row[:delivered] == 'true'

      # 1.1 retrieve the right meal, based on the id
      id_for_meal = row[:meal_id].to_i
      row[:meal] = @meal_repository.find(id_for_meal)

      id_for_customer = row[:customer_id].to_i
      row[:customer] = @customer_repository.find(id_for_customer)

      id_for_employee = row[:employee_id].to_i
      row[:employee] = @employee_repository.find(id_for_employee)

      # 2. Create the new instance
      order = Order.new(row)
      # 3. Populate the orders array
      @orders << order
    end
    @next_id = @orders.empty? ? 1 : @orders.last.id + 1
  end
end
