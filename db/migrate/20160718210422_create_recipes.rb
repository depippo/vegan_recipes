class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :content
      t.integer :preptime
      t.integer :servings

      t.timestamps null: false
    end
  end
end
