class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    while @running
      display_menu
      action = gets.chomp.to_i
      check_action(action)
    end
  end

  def display_menu
    puts "Welcome To Restaurant Manager!"
    puts "->"
    puts "1. List all Meals"
    puts "2. Create a New Meal"
    puts "3. List all Customers"
    puts "4. Create a New Customer"
    puts "5. Quit the Program"
  end

  def check_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @running = false
    end
  end
end
