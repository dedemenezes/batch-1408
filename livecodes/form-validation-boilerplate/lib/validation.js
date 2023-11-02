
// EVENT LISTENER SYNTAX !

// // 1. select the element
// const input = document.querySelector('.form-control')
// console.log(input)
// // 2. add an event listener
// // input.addEventListener(EVENT_TYPE, CALLBACK_FUNTION)
// input.addEventListener('blur', () => {
//   // will run after the event is fired!
//   console.log('EVENT WAS FIRED!!')
// })

// CLOSE EVENT LISTENER SYNTAX

// LIVECODE ⤵️

// VALIDATE FORM INPUTS AND ENABLE BUTTON
// 1. Select all input
const allInputs = document.querySelectorAll('.form-control');
// console.log(allInputs)
const submit = document.querySelector('.btn')
// console.log(submit)
const tos = document.getElementById('tos')
// console.log(tos.checked)


// We need to enable the submit button
// if all inputs are valids
// AND the checkbox input is checked
const enableSubmit = (allInputs) => {
  // Are all inputs valid?
  // 1. Convert our nodeList into an actual Array
  const allFieldsArray = Array.from(allInputs);
  // using the #every() function we
  // check if all of them have the is-valid css class
  const allFieldAreValid = allFieldsArray.every((element) => {
    return element.classList.contains('is-valid')
  })
  // console.log(allFieldAreValid)

  // Is the checkbox checked?
  // 1. access from the input checkbox we selected
  // the "checked" property and assign to a variable
  const checkboxIsChecked = tos.checked

  // Last but not least ;)
  // if both conditions are true
  // we CAN enable the button
  // otherwise
  // we CAN'T
  if (allFieldAreValid && checkboxIsChecked) {
    submit.disabled = false
  } else {
    submit.disabled = true
  }
}

// We go over all the inputs we selected up there
// and for each input we will attach a microphone
// technically speaking, ADD AN EVENT LISTENER
// 0. iterate over all inputs
// 0.1 for each one we bind an event listener
// 1. check if the input is valid
// 2. if it is valid
// 2.1 we add the "is-valid" css class
// 2. if not
// 2.2 we add the "is-invalid" CSS class
// 2.4 we then try enable the submit button

// 0. iterate over all inputs
allInputs.forEach((input) => {
  // code will run for each element of our NodeList
  // 0.1 for each one we bind an event listener
  input.addEventListener('blur', () => {
    // console.log(input)
    // 1. check if the input is valid
    const isValid = input.value !== ''
    // console.log(isValid)
    // 2. if it is valid
    if (isValid) {
      // 2.1 we add the "is-valid" css class
      input.classList.remove('is-invalid');
      input.classList.add('is-valid');
    } else {
      // 2. if not
      // 2.2 we add the "is-invalid" CSS class
      input.classList.remove('is-valid');
      input.classList.add('is-invalid');
    }
    // 2.4 we then try to enable the submit button
    enableSubmit(allInputs)
  })

})

// Add event listener to the input type checkbox (tos)
// every time we check or uncheck the input
// the event CHANGE is fired
// at this moment we need to check
// if we can enable the submit button
tos.addEventListener('change', () => {
  // console.log("CHANGE EVENT WAS FIRED!")
  enableSubmit(allInputs)
})
