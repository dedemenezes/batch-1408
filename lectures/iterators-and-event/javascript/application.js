// ITERATOR

const houses = ['gryffindor', 'slytherin', 'ravenclaw', 'hufflepuff']

let listItems = ''
houses.forEach((houseName) => {
  const listItem = `<li>${houseName}</li>`
  listItems += listItem
})

const unorderedList = `<ul>${listItems}</ul>`
console.log(unorderedList)
// 1. select the body
const body = document.querySelector('body')
body.insertAdjacentHTML('beforeend', unorderedList)

// "<ul><li>gryffindor</li><li>slytherin</li>..</ul>"


// DOM MANIPULATION

// 1. select it
const list = document.querySelector('ul')
list.style.color = 'red'
list.style.listStyleType = "upper-roman";
// ul {
//   color: 'red'
// }

// 0. select all list items
const items = document.querySelectorAll('ul li')
// console.log(items)
// 1. we need to use for each
items.forEach((item) => {
  // 2. for each one of them
  // 3. add the new string
  console.log(item.innerText)
  item.innerText += ' 🧙'
})

// DATASETS

const gryffindor = document.querySelector('.house')
console.log(gryffindor.dataset)

// 1. select all the list items
const houseList = document.querySelectorAll('.house')
// console.log(houseList)
// 2. iterate over them
houseList.forEach((listItem) => {
  // 3. we add the color name to the content
  // 3.1 retrieve the color name
  const colorName = listItem.dataset.color
  listItem.innerText += `- ${colorName}`
  listItem.classList.add(colorName)
})


// EVENTS

// element.addEventListener(eventType, (event) => {
//   // Do something (callback)
// });

// ONE IMAGE
// const img = document.querySelector('#nicolas')
// console.log(img)

// img.addEventListener('click', (event) => {
//   console.log(event)
//   // console.log(event.target) // this returns the HTML ELEMENT where the event was fired!
//   event.target.classList.toggle('img-circle')
// })


// MULTIPLE IMAGES
// 1. select all images
const images = document.querySelectorAll('.avatar')
// 2. iterate over all images
images.forEach((image) => {
  // 3. for each image
  // 3.1 add an event listener (attach a microphone/bind an event)
  image.addEventListener('click', (event) => {
    // 4. make the image circle
    event.target.classList.toggle('img-circle')
  })

})


// CHECK ALL CHECKBOXES
// CONNECTING THE WHOLE LECTURE ;)
// Selecting elements, listen to events and manipulating the dom

// 1. Selecting the elements
// checkboxes ALL
// button
const checkboxes = document.querySelectorAll('.form-check-input')
const btn = document.querySelector('.btn.btn-light')

// 2. add our event listener
btn.addEventListener('click', (event) => {
  // 3. manipulate the checkboxes
  checkboxes.forEach((checkbox) => {
    // way to see if the checkbox is MARKED/CHECKED
    // console.log(checkbox.checked)
    checkbox.checked = !checkbox.checked
    // console.log(checkbox.checked)
  })
})
