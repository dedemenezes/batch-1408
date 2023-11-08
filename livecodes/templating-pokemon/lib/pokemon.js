// select the template
const template = document.querySelector('#cardTemplate')
const infoTemplate = document.querySelector('#infoTemplate')
const container = document.querySelector('#cardsContainer')
const infoContainer = document.querySelector('#infoContainer')

// TODO write your code here
// 1. get it from the api (FETCH)
fetch('https://pokeapi.co/api/v2/pokemon?limit=151')
  .then(response => response.json()) // parsing response
  .then((data) => {
    // console.log(data)
    // 2. we need to iterate
    data.results.forEach((pokemon) => {
      const name = pokemon.name
      console.log(pokemon)
      fetch(pokemon.url)
        .then(response => response.json())
        .then((pokemonData) => {
          console.log(pokemonData)
          const img = pokemonData.sprites.front_default
          const types = pokemonData.types.map((typeObject) => {
            // typeObject => {slot: 1, type: { name: 'normal', url: …}}
            return typeObject.type.name
          }).join(", ") // bug, poison
          // console.log(types)
          // clone the template
          console.log(template.content)
          const clone = template.content.cloneNode(true)
          // fill in with data
          clone.querySelector('h2').textContent = name
          clone.querySelector('img').src = img
          clone.querySelector('p').textContent = types

          clone.querySelector('a').addEventListener('click', (event) => {
            infoContainer.innerHTML = ''
            // 2. clone the template
            const clone = infoTemplate.content.cloneNode(true)
            // 3. fill in with data
            clone.querySelector('h2').textContent = name
            clone.querySelector('img').src = img
            clone.querySelector('p').textContent = types
            // 4. insert into the HTML
            infoContainer.appendChild(clone)
          })
          // 2. insert into the HTML
          container.appendChild(clone)
        })
    })

  })
