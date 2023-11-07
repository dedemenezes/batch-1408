// It's a good practice to have al your selector at the top
// because this way
// THEY ARE AVAILABLE IN EVERY SINGLE FUNCTION!!!
const carsList = document.querySelector('.cars-list')
const form = document.querySelector('.car-form')
const [brand, model, plate, owner] = document.querySelectorAll('.form-control')


// This function has a car Javascript Object as a parameter
// And it build the car card and insert it into the HTML
const insertInList = (carObject) => {
  const carHTML = `<div class="car">
          <div class="car-image">
            <img src="http://loremflickr.com/280/280/${carObject.brand}${carObject.model}" />
          </div>
          <div class="car-info">
            <h4>${carObject.brand} ${carObject.model}</h4>
            <p><strong>Owner:</strong> ${carObject.owner}</p>
            <p><strong>Plate:</strong> ${carObject.plate}</p>
          </div>
        </div>`
  carsList.insertAdjacentHTML('afterbegin', carHTML)
}

// This is our first function that retrieves all cars
// And at the end cal the insertInList to add to the HTML
const fetchAllCars = () => {
  fetch("https://wagon-garage-api.herokuapp.com/cool-garage/cars")
    .then(response => response.json())
    .then((data) => {
      carsList.innerHTML = ''
      data.forEach(car => insertInList(car))
    })
}

// This was our second Challenge
// We submit the form using AJAX
// At the end we call the fetchAllCars to update the HTML accordingly
const createCar = (event) => {
  event.preventDefault()
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
    .then(() => fetchAllCars())
}

// On the second challenge, everything will start when the user submit the form
// We listen to the event and when it's fired
// the callback createCar will run.
form.addEventListener('submit', createCar)

fetchAllCars() // FIRST LOAD!
