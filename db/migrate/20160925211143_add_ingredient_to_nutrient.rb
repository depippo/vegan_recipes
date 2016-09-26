class AddIngredientToNutrient < ActiveRecord::Migration
  def change
    add_column :nutrients, :ingredient_id, :integer
  end
end
