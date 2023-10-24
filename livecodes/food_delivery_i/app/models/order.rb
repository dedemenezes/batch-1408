class Order
  attr_reader :meal, :customer, :employee
  attr_accessor :id
  # id, a meal, a customer, an employee plus a delivered
  def initialize(attributes = {})
    @id = attributes[:id]
    @meal = attributes[:meal]         # references to INSTANCES
    @customer = attributes[:customer] # references to INSTANCES
    @employee = attributes[:employee] # references to INSTANCES
    @delivered = attributes[:delivered] || false # default value!
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end
