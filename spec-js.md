# Specifications for the Rails with jQuery Assessment

Specs:
- [X] Use jQuery for implementing new requirements
- [X] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
      Nutrient show view allows user to cycle between nutrients, backend rendered via JSON.
- [X] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
      Ingredients index page allows user to click to append each ingredient's nutrients to the page, via JSON.
- [X] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
      Ingredient has_many nutrients, rendered on the ingredient index page.
      Ingredient has_many nutrients and has_many recipes, rendered on the ingredient show page.
      User has-many recipes and has_many favorites, rendered on the user show page.
- [X] Include at least one link that loads or updates a resource without reloading the page.
      Recipe comments post to page without reloading.
- [X] Translate JSON responses into js model objects.
      Comments are translated into JS Model Objects.
- [X] At least one of the js model objects must have at least one method added by your code to the prototype.
      Comment has a renderLi method (in recipes.js) that formats the user submitted comment and appends it to the page.

Confirm
- [X] You have a large number of small Git commits
- [X] Your commit messages are meaningful
- [X] You made the changes in a commit that relate to the commit message
- [X] You don't include changes in a commit that aren't related to the commit message
