# TODO: Define your View class here, to display elements to the user and ask them for their input
class View
  def ask_for_index
    puts "Index?"
    gets.chomp.to_i - 1
  end

  def ask_for_name
    puts "Name?"
    gets.chomp
  end

  def ask_for_description
    puts "Description?"
    gets.chomp
  end

  def display_list(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name} | #{recipe.description}"
    end
    # 1. Pizza, very italian pizza
    # 2. ......
  end
end
