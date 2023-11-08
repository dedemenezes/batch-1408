import Mustache from 'mustachejs'
import { createApp } from "vue";


console.log("hello from application.js")

// MUSTACHE LIST RENDERING
const fruits = {
  "fruits": [
    { "name": "apple", "price": 3 },
    { "name": "pear", "price": 2 },
    { "name": "banana", "price": 5 }
  ]
}

const listTemplate = `
  <ul>
    {{#fruits}}
      <li>{{name}}: {{price}} EUR</li>
    {{/fruits}}
  </ul>

`

console.log(Mustache.render(listTemplate, fruits))



const list = document.querySelector('#results')
const template = document.getElementById('movieCardTemplate').innerHTML

fetch("https://www.omdbapi.com/?s=harry%20potter&apikey=adf1f2d7")
  .then(response => response.json())
  .then((data) => {
    // console.log(data.Search)
    list.innerHTML = ''
    const moviesData = { movies: data.Search }
    const renderedHTML = Mustache.render(template, moviesData)
    list.insertAdjacentHTML('beforeend', renderedHTML)
  })




createApp({
  data() {
    return {
      message: "Hello from Vue.JS"
    }
  }
}).mount('#app')
