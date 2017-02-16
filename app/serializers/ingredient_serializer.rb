class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :nutrients
  def self.serialize(ingredient)
    ingredient_recipes = []
    ingredient.recipes.each do |recipe|
      recipe_hash = Hash.new
      recipe_hash["id"] = recipe.id
      recipe_hash["name"] = recipe.name
      ingredient_recipes << recipe_hash
    end
    recipes_hash = ingredient_recipes.to_json
    nutrients = []
    ingredient.nutrients.each do |nutrient|
      nutrient_hash = Hash.new
      nutrient_hash["id"] = nutrient.id
      nutrient_hash["name"] = nutrient.name
      nutrients << nutrient_hash
    end
    nutrients_hash = nutrients.to_json
    serialized_ingredient = '{'
    serialized_ingredient += '"name": ' + '"' + ingredient.name + '"' + ', '
    serialized_ingredient += '"id": ' + ingredient.id.to_s + ', '
    serialized_ingredient += '"recipes": ' + recipes_hash + ','
    serialized_ingredient += '"nutrients": ' + nutrients_hash
    serialized_ingredient += '}'
  end
end
