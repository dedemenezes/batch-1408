console.log("Hello #1408");

// document.querySelector('CSS_SELECTOR')
const players = document.querySelector('#players')
// console.log(players)

// APPEND CONTENT
players.insertAdjacentHTML('beforeend', '<li>Messi</li>')
players.insertAdjacentHTML('beforeend', '<li>Pelé</li>')

// Advanced Selector
const charactersList = document.querySelector('#characters')
const anakin = charactersList.querySelector('.red')
// console.log(anakin)

// SELECT MULTIPLE ELEMENTS
const winners = document.querySelectorAll('#fifa-wins li')
// console.log(winners)
// console.log(winners[0])

// 1. SELECT THE LIST ELEMENT
const winnersList = document.querySelector('#fifa-wins')
console.log(winnersList)
// 2. APPEND NEW ELEMENT TO THE LIST
winnersList.insertAdjacentHTML('beforeend', '<li>France (2 wins)</li>')


// 1. SELECT THE ELEMENT TO MANIPULATE
const paragraph = document.querySelector('.my-5.text-center')
console.log(paragraph)
paragraph.style.color = 'orange'
// paragraph.style.display = 'none'
paragraph.style.backgroundColor = 'blue'

// ADD/REMOVE css CLASSES
const brazil = document.querySelector('#fifa-wins > li')
brazil.classList.add('green')
brazil.classList.remove('green')
brazil.classList.toggle('green')

// READ INPUT
//1. SELECT ELEMENT
const input = document.querySelector('#email')
input.value = 'dede@lw.org'
console.log(input.value)

// EXTRACT TEXT/HTML//Attributes
const link = document.querySelector('#home')
console.log(link)
console.log(link.innerText)
console.log(link.innerHTML)
link.innerText = 'Le Wagon rules!'
link.innerHTML = 'Le Wagon <strong>rules!</strong>'
console.log(link.attributes.href)
