require_relative 'animal'
class Lion < Animal
  def talk
    return "#{@name} roars"
  end

  def eat(food)
    "#{super}. Law of the jungle." # interpolate
    # super + ". Law of the jungle" # concatenate
  end
  # “Simba eats a gazelle. Law of the Jungle!”
end
# nala = Lion.new('nala')
# puts nala.talk
