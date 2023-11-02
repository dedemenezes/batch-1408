console.log(1 + 1)

// DECLARE VARIABLE
const name = 'Andre'
let age = 35

console.log(name)
console.log(age)

// name = 'Carol'
age += 1
console.log(age)

// NUMBER
// typeof(4) ==4.class
console.log(typeof (4))
console.log(typeof (4.3))
// convert string to number
const numAsString = Number.parseInt(4, 10)
const floatAsString = Number.parseFloat(4.3, 10)

console.log(numAsString)
console.log(floatAsString)

// STRING
"hello"
'hello'
const message = `${name} is ${age}`
console.log(message)

// ARRAY
const newArray = ['flamengo', 13]
console.log(newArray[1])
// ACCESS LAST ELEMENT

newArray.push('Le Wagon')
console.log(newArray)
// newArray.slice(position_to_start, number_of_elements[optional])
console.log(newArray.slice(0, 2))


const ron = {
  // DO NOT HAVE SYMBOLS
  // KEYS ARE ALWAYS STRINGS!!!
  house: 'Gryffindor',
  age: 22,
  'First Name': 'Ronald',
  lastName: 'Weasley'
}

console.log(ron['house'])
console.log(ron.house)
console.log(ron['First Name'])

ron.cityAddress = 'The Burrow'
ron['City Address'] = 'The Burrow'
console.log(ron)

age = 17
if (age > 18) {
  console.log('You can vote!')
} else if (age === 17) {
  console.log('You are 17!')
} else {
  console.log('You cannot vote!')
}

// OLD WAY!
// DON'T DO THIS WAY!

function addition(param_one, param_two) {
  const result = param_one + param_two
  // MUST CONTAIN RETURN KEYWORD
  return result
}

// ARROW FUNCTION
// USE THIS!!!
const multiply = (param_one, param_two) => {
  return param_one * param_two
}


// INLINE FUNCTION ALWAYS RETURN
const subtract = (num_one, num_two) => num_one - num_two

console.log(addition(1, 2))
console.log(multiply(2, 2))
console.log(subtract(5, 2))

const capitalizeWord = (word) => {
  const firstLetter = word[0].toUpperCase()
  const restOfWord = word.substring(1, 3).toLowerCase()
  console.log(word.substring(1))
  return `${firstLetter}${restOfWord}`
}

console.log(capitalizeWord('sChOOL'))
