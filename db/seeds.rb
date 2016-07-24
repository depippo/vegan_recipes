# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#INGREDIENTS = ["whole wheat spaghetti", "olive oil", "garlic", "mushrooms", "sea salt", "black pepper", "vegetable broth", "white wine", "parsley", "bread crumbs"]

#INGREDIENTS.each{|ingredient| Ingredient.create!(:name => ingredient)}

alan = User.create!(:email => "alan@gmail.com", :password => "password")

whole_wheat_spaghetti = Ingredient.create!(:name => "whole wheat spaghetti")
olive_oil = Ingredient.create!(:name => "olive oil")
garlic = Ingredient.create!(:name => "garlic")
mushrooms = Ingredient.create!(:name => "mushrooms")
sea_salt = Ingredient.create!(:name => "sea salt")
black_pepper = Ingredient.create!(:name => "black pepper")
vegetable_broth = Ingredient.create!(:name => "vegetable broth")
white_wine = Ingredient.create!(:name => "white wine")
parsley = Ingredient.create!(:name => "parsley")
bread_crumbs = Ingredient.create!(:name => "bread crumbs")
cereal = Ingredient.create!(:name => "cereal")
almond_milk = Ingredient.create!(:name => "almond milk")
bread = Ingredient.create!(:name => "bread")
lettuce = Ingredient.create!(:name => "lettuce")
tomato = Ingredient.create!(:name => "tomato")
veganaise = Ingredient.create!(:name => "veganaise")


alan_recipe_1 = alan.recipes.create!(user_id: alan.id, name: "Alan's favorite", content: "Content would go here.", preptime: "20", servings: "4",
  :ingredient_ids => [whole_wheat_spaghetti.id, olive_oil.id, garlic.id, mushrooms.id, sea_salt.id, black_pepper.id, vegetable_broth.id, white_wine.id, parsley.id, bread_crumbs.id])

alan_recipe_2 = alan.recipes.create!(user_id: alan.id, name: "Alan's breakfast", content: "Content would go here.", preptime: "2", servings: "1",
  :ingredient_ids => [cereal.id, almond_milk.id])

alan_recipe_3 = alan.recipes.create!(user_id: alan.id, name: "Alan's sandwich", content: "Content would go here.", preptime: "20", servings: "4",
  :ingredient_ids => [bread.id, lettuce.id, tomato.id, veganaise.id])
