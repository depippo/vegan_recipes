class NutrientIngredient < ActiveRecord::Base
  belongs_to :nutrient
  belongs_to :ingredient
end
