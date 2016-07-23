class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :ratings
  
  def ingredients_attributes=(ingredient_attributes)
    ingredient_attributes.values.each do |ingredient_attribute|
      unless ingredient_attribute['name'] == ""
        ingredient = Ingredient.where(name: ingredient_attribute[:name].downcase).first_or_create
        self.ingredients << ingredient
      end
    end
  end

  def average_score
    scores = []
    self.ratings.each do |rating|
      unless rating.score.nil?
        scores << rating.score
      end
    end
    scores.inject{ |sum, el| sum + el }.to_f / scores.size
  end

end
