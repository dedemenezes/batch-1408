// console.log("Connected")
// FETCH ALL CARS
// 1 . retrieve all cars from the API (fetch)
const fetchAllCars = () => {
  fetch("https://wagon-garage-api.herokuapp.com/cool-garage/cars")
    .then(response => response.json())
    .then((data) => {
      // console.log(data)
      const carsList = document.querySelector('.cars-list')
      carsList.innerHTML = ''
      // 2.0 we need to iterate over all cars
      data.forEach((car) => {
        console.log(car)
        // car is something like => { id: 16205, brand: 'Jeep', model: 'Gladiator', plate: '123CP56', owner: 'Camila', … }
        // 2. Display each one to the user (insert into the HTML)

        const carHTML = `<div class="car">
          <div class="car-image">
            <img src="http://loremflickr.com/280/280/${car.brand}${car.model}" />
          </div>
          <div class="car-info">
            <h4>${car.brand} ${car.model}</h4>
            <p><strong>Owner:</strong> ${car.owner}</p>
            <p><strong>Plate:</strong> ${car.plate}</p>
          </div>
        </div>`
        carsList.insertAdjacentHTML('afterbegin', carHTML)
      })
    })
}

fetchAllCars() // FIRST LOAD!
// ADD A NEW CAR
// 1. Select the elements
const form = document.querySelector('.car-form')
// 2. bind an event listener
form.addEventListener('submit', (event) => {
  event.preventDefault()
  // 3. PRvent the page to refresh
  // console.log('TESTINGGGGG')
  // 4. retrieve every input value
  // DECONSTRUCT
  const [brand, model, plate, owner] = document.querySelectorAll('.form-control')
  // console.log(brand.value)
  // console.log(model)
  // console.log(plate)
  // console.log(owner)
  // 5. send our form to the API (fetch - POST)
  fetch("https://wagon-garage-api.herokuapp.com/cool-garage/cars", {
    method: 'POST',
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      brand: brand.value,
      model: model.value,
      owner: owner.value,
      plate: plate.value
    })
  })
  .then(response => response.json())
  .then((data) => {
    console.log(data)
    // FETCH ALL CARS
    fetchAllCars()
  })
})
// 6. display the new car
