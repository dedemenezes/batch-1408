require_relative './task'
require_relative './task_repository'
require_relative './view'
require_relative './controller'

# view = View.new
# description = view.ask_for_description
# task_one = Task.new(description)
# p task_one
# # p task_two

# # p task_repository
# task_repository.add_task(task_one)
# p task_repository
# # task_repository.add_task(task_two)
# # p task_repository

task_repository = TaskRepository.new
controller = Controller.new(task_repository)
controller.add_task
controller.add_task
# p task_repository
controller.list
controller.remove_task
