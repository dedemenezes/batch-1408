class Router
  def initialize(controller)
    @running = true
    @controller = controller
  end

  def run
    while @running
      # display the options
      puts "What would you like to do:"
      puts '1. Add a new task'
      puts '2. List all tasks'
      puts '3. Remove a task'
      puts '4. Mark a task as done'
      puts '5. Quit'
      user_action = gets.chomp

      case user_action
      when '1' then @controller.add_task
      when '2' then @controller.list
      when '3' then @controller.remove_task
      when '4' then @controller.mark_task_as_done
      when '5' then @running = false
      else
        puts "Wrong action"
      end
    end
  end
end
