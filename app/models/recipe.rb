class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :nutrients, :through => :ingredients, :class_name => "Nutrient"
  has_many :ratings
  has_many :photos
  validates :name, :content, :ingredients, presence: true
  validates :preptime, :servings,  numericality: {greater_than_or_equal_to: 1}
  accepts_nested_attributes_for :photos
  accepts_nested_attributes_for :nutrients
  
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

  def self.recipes_with_ratings
    recipes_with_ratings = []
    self.all.each do |recipe|
      if recipe.ratings.count > 0
        recipes_with_ratings << recipe
      end
    end
    recipes_with_ratings
  end

  def self.highest_rated
    recipes = self.recipes_with_ratings
    recipes.max_by(&:average_score)
  end

  def user_score(recipe, user)
    rating = Rating.where(recipe_id: recipe, user_id: user).first
    rating.score
  end

  def self.sort_by_average_score
    recipes = self.recipes_with_ratings
    recipes.sort! { |a, b| b.average_score <=> a.average_score}
  end

end
