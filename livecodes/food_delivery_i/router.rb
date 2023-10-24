# frozen_string_literal: true

class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = true
  end

  def run
    # APP LOOP
    while @running
      @current_user = @sessions_controller.login
      # SESSION LOOP
      while @current_user
        if @current_user.manager? # (employee is a manager)
          display_manager_menu
          action = gets.chomp.to_i
          print `clear`
          check_manager_action(action)
        else
          display_rider_menu
          action = gets.chomp.to_i
          print `clear`
          check_rider_action(action)
        end
      end
    end
    puts 'Goodbye zo/'
  end

  def display_rider_menu
    puts 'Welcome To Restaurant Rider!'
    puts '1. Mark one of my orders as delivered'
    puts '2. List all my undelivered orders'
    puts '8. Logout'
    puts '9. Quit the program'
  end

  def display_manager_menu
    puts 'Welcome To Restaurant Manager!'
    puts '->'
    puts '1. List all Meals'
    puts '2. Create a New Meal'
    puts '3. List all Customers'
    puts '4. Create a New Customer'
    puts '5. Create new order'
    puts '6. List undelivered orders'
    puts '8. Logout'
    puts '9. Quit the Program'
  end

  def check_manager_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @orders_controller.add
    when 6 then @orders_controller.list_undelivered_orders
    when 8
      # KILL SESSION LOOP
      @current_user = nil
    when 9
      # KILL SESSION LOOP
      @current_user = nil
      # KILL APP LOOP
      @running = false
    end
  end

  def check_rider_action(action)
    case action
    when 1 then @orders_controller.mark_as_delivered(@current_user)
    when 2 then @orders_controller.list_my_orders(@current_user)
    when 8
      # KILL SESSION LOOP
      @current_user = nil
    when 9
      # KILL SESSION LOOP
      @current_user = nil
      # KILL APP LOOP
      @running = false
    end
  end
end
