class TaskRepository
  # STATE/ATTRIBUTE
  # tasks => an array of INSTANCE OF Task
  def initialize
    @tasks = []
  end

  # BEHAVIOUR
  # ADD A TASK
  def add_task(task)
    @tasks << task
  end

  def all
    @tasks
  end

  def remove_task(task_index)
    @tasks.delete_at(task_index)
  end

  def mark_as_done(task_index)
    # 1. retrieve the right task and assign to a variable
    task = @tasks[task_index]
    # 2. marks the specific task as done
    task.done!
  end
end
