#  TODO: Define your Recipe class here
class Recipe
  attr_reader :name, :description, :pikachu

  # name
  # description
  def initialize(name, desc)
    @name        = name
    @description = desc
  end
end

# pizza = Recipe.new('pizza', 'pizza description')
# p pizza
