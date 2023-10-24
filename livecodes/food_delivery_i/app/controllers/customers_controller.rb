# frozen_string_literal: true

require_relative '../models/customer'
require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customer_view = CustomerView.new
  end

  def add
    name = @customer_view.ask_for_name
    address = @customer_view.ask_for_address
    new_customer = Customer.new(name: name, address: address)
    @customer_repository.create(new_customer)
  end

  def list
    customers = @customer_repository.all
    @customer_view.display_customers(customers)
  end
end
