require_relative './view'
require_relative './task'

class Controller
  def initialize(task_repository)
    @view = View.new
    @task_repository = task_repository
  end

  # BEHAVIOURS

  def add_task
    # 1. Ask for the description and store in a varaible (VIEW)
    desc = @view.ask_for_description
    # 2. Create the new task with the description
    new_task = Task.new(desc)
    # 3. Add this new task to our repository
    @task_repository.add_task(new_task)
  end

  def list
    # 1. we need all tasks
    all_tasks = @task_repository.all
    # 2. Ask the view to display all tasks (VIEW)
    @view.display(all_tasks)
  end

  def remove_task
    # 1. Ask for the task INDEX to delete and assign to a variable
    index = @view.ask_for_index
    # 2. TELL the REPOSOTIRY to Delete the task
    @task_repository.remove_task(index)
  end

  def mark_task_as_done
    # 1. Ask for the task INDEX to be marked as done
    index = @view.ask_for_index
    # 2. Tell the repository to mark my task as done
    @task_repository.mark_as_done(index)
  end
end
