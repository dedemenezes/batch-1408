require_relative './router'
require_relative './controller'
require_relative './task_repository'

task_repo = TaskRepository.new
controller = Controller.new(task_repo)
router = Router.new(controller)
router.run
