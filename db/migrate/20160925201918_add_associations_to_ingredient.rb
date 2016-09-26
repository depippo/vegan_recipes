class AddAssociationsToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients, :recipe_id, :integer
    add_column :ingredients, :nutrient_id, :integer
  end
end
