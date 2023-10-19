require_relative './building'

# CLASSES are factories. We define what they are (STATE[instance_variables])
# and what they DO (BEHAVIOUR[methods])
class Skyscrapper < Building
  # change the Initialize
  attr_reader :number_of_floors
  def initialize(name, width, length, number_of_floors)
    # `super` will call the SAME METHOD on the ParentClass
    super(name, width, length)
    @number_of_floors = number_of_floors
  end

  # INSTANCE METHODS
  def details
    # `self` will reference the element which called the method
    # "#{self.name_capitalized} has #{@number_of_floors} floors"
    "#{name_capitalized} has #{@number_of_floors} floors"
  end

  def name_capitalized
    @name.capitalize
  end

end

# class ParentClass
# end

# class ChildClass < ParentClass
# end
