# Stimulus JS

Stimulus has three **main parts**
1. Controller
2. Actions
3. Targets

### Controller
Just like in our ruby apps, the controller is the maneger. The one responsible for the Javascript behaviour we want to implement. In order to create a controller we must follow the **Naming Convention** ⤵️

1. file name must end with: `controller_name_controller.js`.e.g: `toggle_controller.js`, `popup_controller.js`
2. The controller element should encapsulate the `data-action` and `data-targets` attributes

### Actions
Actions are the Stimulus way of **binding an EventListener**. Instead of selecting the element and then binding the EventListener, we can now do it **straight into the HTML** using `data-action="eventType->controller-name#functionName`. Adding this data-attribute we are telling Stimulus to listen to the `Click` event. When firing the event, Stimulus should call the correct controller using the `controller-name` from the `data-action attribute`. It will automatically execute the function `functionName` that lives inside the `controler-name`. ⤵️
E.G.: `data-action="submit->movies#updateList"`. When firing `submit` event, Stimulus will cal the `MoviesController` and execute the callback function `updateList`.


### Targets
Targets are the abstraction of our beloved `document.querySelector(CSS_SELECTOR)`. Instead of assigning an ID or a CSS class and use it to select the element we can do it **straight into the HTML**. Different from the actions, to add a Stimulus Target, it's a **TWO STEP** proccess ⤵️
1. **into the HTML** we add our `data-controller-name-target="targetName"`
2. **into the right Stimulus Controller** we add the reference to this target using: **static targets = ["targetName"]**
3. Now we can access the selected element inside the controller class using: **this.targetNameTarget**

E.G.: We want to select an _ul_ HTML tag to use inside our `movies_controller.js`. We will add `data-movies-target="list"`. "list" is the name of my target. It can be anything, we try to give it a meaningful name 😉. You can think about it like we were assigning an `ID` but the correct phrasing is we are **binding an target**. After adding the data attribute to the HTML we **must** reference this new target inside our `movies_controller.js`. We do it adding `static targets = ['list']`. From now on, any time that we want to access the selected element **inside the movies_controller** we can do: `this.listTarget`and it will return the HTML element, just like we had when using `querySelector` and assigning to a variable (`const list = document.querySelector('#list')`).
