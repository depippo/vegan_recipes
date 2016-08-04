# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
  Recipe has_many Ratings
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
  Photo belongs to Recipe
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
  Ingredient has_many Recipes through Recipe_Ingredients
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
  recipe.preptime, recipe.servings, etc.
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  Recipe must include name, content, and ingredients. Preptime and servings must be greater than or equal to 1. Ingredients must have a name. Users must have email and password.

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
  Recipe.highest_rated URL: /recipes/highest_rated
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
  /recipe/new, Ingredient
- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
  Omniauth Facebook
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
  /recipes/8/photos
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
  /recipes/8/photos/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
  /recipes/new

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
