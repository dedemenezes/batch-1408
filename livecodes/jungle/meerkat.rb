require_relative 'animal'
class Meerkat < Animal
  def talk
    return "#{@name} barks"
  end
end
