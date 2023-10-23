class CustomerView

  def ask_for_name
    puts "Name ?"
    gets.chomp
  end

  def ask_for_address
    puts "Address? "
    gets.chomp
  end

  def display_customers(customers)
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name} - #{customer.address}"
    end
  end
end
