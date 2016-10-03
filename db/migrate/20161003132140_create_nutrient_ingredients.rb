class CreateNutrientIngredients < ActiveRecord::Migration
  def change
    create_table :nutrient_ingredients do |t|
      t.belongs_to :nutrient
      t.belongs_to :ingredient
    end
  end
end
