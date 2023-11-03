const houses = ['gryffindor', 'slytherin', 'ravenclaw', 'hufflepuff']

houses.forEach((houseName) => {
  upcasedHouseName = houseName.toUpperCase()
  console.log(upcasedHouseName)
})

// => gryffindor
// => slytherin
// => ravenclaw

const student = {
  // key: value
  firstName: 'Draco'
}

// console.log(student['firstName'])
// console.log(student.firstName) // PREFERE THIS ONE!
student.lastName = 'Malfoy'
student.firstName = 'Lucius'
console.log(student)
