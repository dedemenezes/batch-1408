class OrderView
  def ask_for(stuff)
    puts "#{stuff}?"
    gets.chomp
  end

  def display_orders(orders_array)
    orders_array.each_with_index do |order, index|
      puts "#{index + 1} - Meal: #{order.meal.name} - Customer: #{order.customer.name} - Rider: #{order.employee.username}"
    end
  end
end
