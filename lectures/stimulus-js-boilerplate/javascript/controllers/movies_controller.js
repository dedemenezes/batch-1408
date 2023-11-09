import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['input', 'list']
  static values = {
    // key: value
    baseUrl: String,
    maximum: Number
  }

  // it runs as soon as my Stimulus controller
  // is connected to the DOM (when it appears)
  // Connect SYNTAX in the HTML=> data-controller="movies"
  connect() {
    console.log("Hello from movies Stimulus controller");
    console.log(this.inputTarget)
    console.log(this.listTarget)
    console.log(this.maximumValue)
    console.log(this.baseUrlValue)
  }

  updateList(event) {
    event.preventDefault()
    console.log(this.inputTarget.value)
    console.log("submit event fired!");
    this.fetchMovies()
  }

  fetchMovies(){
    const url = `${this.baseUrlValue}?s=${this.inputTarget.value}&apikey=adf1f2d7`
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        // console.log(data)
        this.insertInList(data)
      })
  }

  insertInList(data) {
    this.listTarget.innerHTML = ''
    data.Search.forEach((movie) => {
      // build html
      const movieHTML = `
            <li class="list-group-item border-0">
              <img src="${movie.Poster}" alt="${movie.Title}" width="100" height="100%">
            </li>
          `

      // insert into the list
      this.listTarget.insertAdjacentHTML('beforeend', movieHTML)
    })
  }
}
