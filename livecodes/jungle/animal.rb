class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.phyla
    ['Porifera', 'Arthropoda', 'Vertebrata', 'Protochordata']
  end
  # def name
  #   return @name
  # end

  # Add an #eat(food) instance method in Animal which returns a sentence like “Timon eats a scorpion”
  def eat(food)
    "#{@name} eats a #{food}"
  end
end
