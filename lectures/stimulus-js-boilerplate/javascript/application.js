import { Application, Controller } from 'stimulus';
window.Stimulus = Application.start()

import DisableButtonController from "./controllers/disable_button_controller.js"
Stimulus.register("disable-button", DisableButtonController)

import MoviesController from './controllers/movies_controller.js'
Stimulus.register('movies', MoviesController)

// RECAP
// // 1. Select the element
// const button = document.querySelector('#click-me');
// // 2. bind an event listener
// button.addEventListener('click', (event) => {
//   // access the HTML element where the event was fired
//   console.log(event.currentTarget)
//   event.currentTarget.innerText = 'Clicked!'
//   event.currentTarget.disabled = true
//   event.currentTarget.classList.add('btn-secondary')
// })

// const button = document.querySelector('#button')
