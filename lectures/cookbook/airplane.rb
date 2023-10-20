class Airplane
  # STATE/ATTRIBUTES
  # number_of_seats => integer
  # is_narrow => boolean
  attr_reader :is_narrow # ,:number_of_seats
  # attr_writer :number_of_seats
  attr_accessor :number_of_seats
  def initialize(number_of_seats, is_narrow)
    @number_of_seats = number_of_seats
    @is_narrow = is_narrow
  end

  def self.categories
    ['Airbus', 'Embraer']
  end

  def fly
    'airplane flying'
  end
end
first_airplane = Airplane.new(200, false)
p first_airplane
p first_airplane.number_of_seats
p first_airplane.is_narrow

puts "removing some seats"
first_airplane.number_of_seats = 190
p first_airplane

p first_airplane.fly

p Airplane.categories
