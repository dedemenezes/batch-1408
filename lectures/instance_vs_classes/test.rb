# new INSTANCE of House class
require_relative './house.rb'
require_relative './skyscrapper'
require_relative 'castle'
# CLASSES are factories. We define what they are (STATE[instance_variables])
# and what they DO (BEHAVIOUR[methods])
# INSTANCE are OBJECTS created using a factory

# Create a new INSTANCE of House class
# and assign it to the variable
my_house = House.new('My home', 20, 30)
your_house = House.new('Your house', 40, 50)
p my_house.name
#=> 'My home'
p your_house.length
p my_house.floor_area

empire_state = Skyscrapper.new('Empire State Building', 100, 100, 75)
p empire_state
p empire_state.details

hogwarts = Castle.new('Hogwarts', 400, 100)
p hogwarts.has_a_moat? #=> true/false
p hogwarts.moat #=> true/false
# hogwarts.moat=(true)
hogwarts.moat = true
p hogwarts.has_a_moat?

puts "Floor Area"
p hogwarts.floor_area
# Castle.has_a_moat? #=> this line throws an error because we can't call an INSTANCE METHOD on a CLASS

p Castle.categories
