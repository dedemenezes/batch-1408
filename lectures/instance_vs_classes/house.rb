# CLASS - factory to create new houses
# CLASSES are factories. We define what they are (STATE[instance_variables])
# and what they DO (BEHAVIOUR[methods])

require_relative 'building'
class House < Building
end

# new INSTANCE of House class
# my_house = House.new('My home', 20, 30)
# your_house = House.new('Your house', 40, 50)
# p my_house.name
# #=> 'My home'
# p your_house.length

# p my_house.floor_area
