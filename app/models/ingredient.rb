class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  has_many :nutrient_ingredients
  has_many :nutrients, -> { uniq }, through: :nutrient_ingredients
  belongs_to :recipe
  validates :name, presence: true

  def nutrients_attributes=(nutrient_attributes)
    nutrient_attributes.values.each do |nutrient_attribute|
      unless nutrient_attribute['name'] == ""
        nutrient = Nutrient.where(name: nutrient_attribute[:name].downcase).first_or_create
        self.nutrients << nutrient
      end
    end
  end

end
