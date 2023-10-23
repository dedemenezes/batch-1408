require_relative '../views/meal_view'
require_relative '../models/meal'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meal_view = MealView.new
  end

  def add
    name = @meal_view.ask_for_name
    price = @meal_view.ask_for_price
    new_meal = Meal.new(name: name, price: price)
    @meal_repository.create(new_meal)
  end

  def list
    meals = @meal_repository.all
    @meal_view.display_meals(meals)
  end
end
