// REHEARSAL

// // 1. SELECT THE ELEMENT
// const btn = document.querySelector('.btn.btn-warning')
// // console.log(btn);
// // 2. Add an event listener
// btn.addEventListener('click', (event) => {
//   // retrieve the element where the event was fired
//   // console.log(event.currentTarget)
//   event.currentTarget.innerText = 'Get me an activity'
//   event.currentTarget.disabled = true
// })
// // 3. when the event is fired
// // 4. disable the button
// // 4.1 update the button text

// LECTURE!

// SYNTAX
// fetch(anUrl)
//   .then(response => response.json())
//   .then((data) => {
//     console.log(data)
//   })


// TODO - Fetch an activity with the Bored API - Let's psuedocode!
const url = 'https://www.boredapi.com/api/activity/'

// 1. Select elements you will need to manipulate
const btn = document.querySelector('.btn')
const header = document.querySelector('#activity')

const insertActivity = (data) => {
  header.innerText = data.parsedResponse
}
// console.log(btn, header);
// 2. add an event
btn.addEventListener('click', (event) => {
  // 3. fetch an activity from Bored API
  fetch("http://www.boredapi.com/api/activity/")  // MAKE HTTP REQUEST
    .then(response => response.json())            // PARSING THE RESPONSE
    .then((parsedResponse) => {                   // Assigning the parsed response
      console.log(parsedResponse)                 //  to our DATA variable
      console.log(parsedResponse.activity)
      // 4. Display the activity to our User
      // header.innerText = parsedResponse.activity
      insertActivity(parsedResponse);
    })
})
