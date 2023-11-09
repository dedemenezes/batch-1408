import { Application, Controller } from 'stimulus';
window.Stimulus = Application.start()

import ListController from './controllers/list_controller.js'
window.Stimulus.register('list', ListController);
