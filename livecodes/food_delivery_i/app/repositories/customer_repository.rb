# frozen_string_literal: true

require 'csv'

class CustomerRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @customers = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def all
    @customers
  end

  def find(customer_id)
    @customers.find { |customer| customer.id == customer_id }
  end

  def create(new_customer)
    new_customer.id = @next_id
    @next_id += 1
    @customers << new_customer
    save_csv
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << %w[id name address]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      customer = Customer.new(row)
      @customers << customer
    end
    @next_id = @customers.empty? ? 1 : @customers.last.id + 1
  end
end
