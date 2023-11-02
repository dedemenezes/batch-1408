// // 1. select the element
// const input = document.querySelector('.form-control')
// console.log(input)
// // 2. add an event listener
// // input.addEventListener(EVENT_TYPE, CALLBACK_FUNTION)
// input.addEventListener('blur', () => {
//   // will run after the event is fired!
//   console.log('EVENT WAS FIRED!!')
// })

// VALIDATE FORM INPUTS AND ENABLE BUTTON
// 1. Select all input
const allInputs = document.querySelectorAll('.form-control');
const submit = document.querySelector('.btn')
const tos = document.getElementById('tos')
console.log(tos.checked)

tos.addEventListener('change', () => {
  // console.log("CHANGE EVENT WAS FIRED!")
  enableSubmit(allInputs)
})

const enableSubmit = (allInputs) => {
  const allFieldsArray = Array.from(allInputs);
  // check if all of them have the is-valid css class
  const allFieldAreValid = allFieldsArray.every((element) => {
    return element.classList.contains('is-valid')
  })
  // console.log(allFieldAreValid)

  // NEED TO BE SURE THAT THE CHECKBOX IS CHECKED
  const checkboxIsChecked = tos.checked

  if (allFieldAreValid && checkboxIsChecked) {
    submit.disabled = false
  } else {
    submit.disabled = true
  }
}

// console.log(allInputs);
allInputs.forEach((input) => {
  // code will run for each element of our NodeList
  // 2. to each input add an event listener
  input.addEventListener('blur', () => {
    // 3. for each input check if it's valid
    // console.log(input)
    const isValid = input.value !== ''
    // console.log(isValid)
    // 4. if it's valid
    if (isValid) {
      // 4.1 add is-valid css class
      input.classList.remove('is-invalid');
      input.classList.add('is-valid');
    } else {
      // 4.2 not valid
      // 4.3 add is-invalid css class
      input.classList.remove('is-valid');
      input.classList.add('is-invalid');
    }
    // 5. enable the submit button
    enableSubmit(allInputs)
  })

})
