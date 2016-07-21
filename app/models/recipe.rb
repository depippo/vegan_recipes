class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  
  def ingredients_attributes=(ingredient_attributes)
    ingredient_attributes.values.each do |ingredient_attribute|
      unless ingredient_attribute['name'] == ""
        ingredient = Ingredient.where(name: ingredient_attribute[:name].downcase).first_or_create
        self.ingredients << ingredient
      end
    end
  end

end

