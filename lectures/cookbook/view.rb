# puts / gets.chomp
class View
  # BEHAVIOURS
  def ask_for_description
    puts "Description?"
    return gets.chomp
  end

  def ask_for_index
    puts "Which task? (give us the number)"
    return gets.chomp.to_i - 1
  end

  def display(tasks_array)
    tasks_array.each_with_index do |task, index|
      # ternary operator
      # condition ? code_if_true : code_if_false
      puts "#{index + 1}. #{task.done? ? '[X]' : '[ ]'} #{task.description}"
    end

    # 1. [ ] Finish TODO manager
    # 2. [X] Recap MVC

  end
end
