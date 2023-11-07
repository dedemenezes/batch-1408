// Uncomment lines below if you want to see
// Javascript working ASYNCHRONOUSLY

// const url = "https://api.github.com/users/dhh"
// fetch(url)
//   .then(response => response.json())
//   .then((data) => {
//     console.log(data)
//   })
// console.log('HELLO FROM LINE 7!!!')


import Swal from 'sweetalert2'

// 1. Select the elements we need to manipulate
const form = document.querySelector('#form')
const inputEmail = document.querySelector('#email')
const inputPassword = document.querySelector('#password')

// 3. we submoit the form to the API to register the user
const signUp = (event) => {
  event.preventDefault()

  // Assing second argument for FETCH into a variable
  const requestDetails = {
    // key: value
    method: 'POST',
    // WHAT TYPE OF DATA WE ARE SUMITTING
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ "email": inputEmail.value, "password": inputPassword.value })
  }

  // Because it's a POST request WE MUST pass the second argument!!
  fetch("https://reqres.in/api/register", requestDetails)
    .then((response) => {
      console.log(response)
      if (response.status === 200) {
        Swal.fire({ title: 'Success', text: 'You are connected', icon: 'success' })
      } else {
        Swal.fire({ title: 'Error!', text: 'Oups! Something went wrong', icon: 'error' })
      }
    })
}

// 2. listen to an event
form.addEventListener('submit', signUp)
