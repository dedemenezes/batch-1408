import { Controller } from 'stimulus'

export default class extends Controller {

  static targets = ['link', 'button', 'pikachu']

  // it runs as soon as my Stimulus controller
  // is connected to the DOM (when it appears)
  // Connect SYNTAX in the HTML=> data-controller="disable-button"
  connect() {
    console.log("Hello from our first Stimulus controller");
  }

  disable() {
    console.log(this.element); // brings back the HTML ELEMENT that contains the data-controller attribute
    // this.targetNameTarget
    console.log(this.linkTarget)
    console.log(this.buttonTarget)
    this.buttonTarget.innerText = 'Bingo!'
    this.buttonTarget.classList.add('btn-secondary')
    this.buttonTarget.disabled = true

    this.linkTarget.classList.remove('d-none')
  }
}
