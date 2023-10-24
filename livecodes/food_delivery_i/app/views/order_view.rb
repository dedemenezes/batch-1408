class OrderView
  def ask_for(stuff)
    puts "#{stuff}?"
    gets.chomp
  end

  def display_orders(orders_array)
    orders_array.each do |order|
      puts "#{order.id} - Meal: #{order.meal.name} - Customer: #{order.customer.name} - Rider: #{order.employee.username}"
    end
  end
end
