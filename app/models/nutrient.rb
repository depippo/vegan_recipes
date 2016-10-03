class Nutrient < ActiveRecord::Base
  has_many :nutrient_ingredients
  has_many :nutrient_recipes
  has_many :ingredients, through: :nutrient_ingredients
  has_many :recipes, through: :nutrient_recipes
end