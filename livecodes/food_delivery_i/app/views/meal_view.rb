# frozen_string_literal: true

class MealView
  def ask_for_name
    puts 'Name? '
    gets.chomp
  end

  def ask_for_price
    puts 'Price? '
    gets.chomp.to_i
  end

  def display_meals(array)
    array.each do |meal|
      puts "#{meal.id} - #{meal.name} - R$#{meal.price}"
    end
  end
end
