import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['input', 'submit']
  connect() {
    console.log('My controller is connected!')
    console.log(this.submitTarget)
  }

  add(event) {
    event.preventDefault()
    // console.log('from add funtion')
    // 2.3 retrieve what the user typed in the input
    // 2.3.1 we need to select the input
    // 2.3.2 retrieve the value
    // console.log(this.inputTarget.value)
    const itemName = this.inputTarget.value
    // 2.4 insert into the list the item
    // 2.4.1 Select the element
    // 2.4.2 insert the item into the list
    this.submitTarget.insertAdjacentHTML('beforeend', `<li class="list-group-item">${itemName}</li>` )
    this.inputTarget.value = ''
  }
}
