alan = User.create!(:email => "alan@gmail.com", :password => "password")
jeff = User.create!(:email => "jeff@gmail.com", :password => "password")
chloe = User.create!(:email => "chloe@gmail.com", :password => "password")

protein = Nutrient.create!(:name => "protein")
vitamin_a = Nutrient.create!(:name => "vitamin A")
vitamin_b6 = Nutrient.create!(:name => "vitamin B6")
vitamin_b12 = Nutrient.create!(:name => "vitamin B12")
vitamin_c = Nutrient.create!(:name => "vitamin C")
vitamin_e = Nutrient.create!(:name => "vitamin E")
vitamin_k = Nutrient.create!(:name => "vitamin K")
manganese = Nutrient.create!(:name => "manganese")
fiber = Nutrient.create!(:name => "fiber")
calcium = Nutrient.create!(:name => "calcium")
iron = Nutrient.create!(:name => "iron")
zinc = Nutrient.create!(:name => "zinc")

whole_wheat_spaghetti = Ingredient.create!(:name => "whole wheat spaghetti")
olive_oil = Ingredient.create!(:name => "olive oil", :nutrient_ids => [vitamin_e.id])
garlic = Ingredient.create!(:name => "garlic", :nutrient_ids => [manganese.id])
mushrooms = Ingredient.create!(:name => "mushrooms")
sea_salt = Ingredient.create!(:name => "sea salt")
black_pepper = Ingredient.create!(:name => "black pepper")
vegetable_broth = Ingredient.create!(:name => "vegetable broth")
white_wine = Ingredient.create!(:name => "white wine")
parsley = Ingredient.create!(:name => "parsley")
bread_crumbs = Ingredient.create!(:name => "bread crumbs")
cereal = Ingredient.create!(:name => "cereal")
almond_milk = Ingredient.create!(:name => "almond milk", :nutrient_ids => [calcium.id, vitamin_e.id])
bread = Ingredient.create!(:name => "bread")
lettuce = Ingredient.create!(:name => "lettuce")
tomato = Ingredient.create!(:name => "tomato", :nutrient_ids => [vitamin_c.id, vitamin_k.id])
veganaise = Ingredient.create!(:name => "veganaise")
pita_pockets = Ingredient.create!(:name => "pita pockets")
nutritional_yeast = Ingredient.create!(:name => "nutritional yeast", :nutrient_ids => [protein.id, fiber.id, vitamin_b6.id, vitamin_b12.id])
tofu = Ingredient.create!(:name => "tofu", :nutrient_ids => [protein.id, calcium.id, manganese.id, iron.id, zinc.id])
cherry_tomatoes = Ingredient.create!(:name => "cherry tomatoes", :nutrient_ids => [vitamin_c.id, vitamin_k.id])
basil = Ingredient.create!(:name => "basil")
balsamic_vinegar = Ingredient.create!(:name => "balsamic vinegar", :nutrient_ids => [iron.id, manganese.id])
flour = Ingredient.create!(:name => "flour")
canola_oil = Ingredient.create!(:name => "canola oil")
zucchini = Ingredient.create!(:name => "zucchini")
chickpeas = Ingredient.create!(:name => "chickpeas", :nutrient_ids => [protein.id, fiber.id, manganese.id, iron.id, zinc.id])
lemon_juice = Ingredient.create!(:name => "lemon juice", :nutrient_ids => [vitamin_c.id])
capers = Ingredient.create!(:name => "capers")
cayenne = Ingredient.create!(:name => "cayenne")
bell_pepper = Ingredient.create!(:name => "bell pepper", :nutrient_ids => [vitamin_a.id, vitamin_b6.id, vitamin_c.id, vitamin_e.id])
baguette = Ingredient.create!(:name => "baguette")
cauliflower = Ingredient.create!(:name => "cauliflower", :nutrient_ids => [vitamin_c.id, vitamin_k.id, vitamin_b6.id, fiber.id])
onion = Ingredient.create!(:name => "onion", :nutrient_ids => [manganese.id, vitamin_b6.id, vitamin_c.id, fiber.id])
thyme = Ingredient.create!(:name => "thyme")

alan_recipe_1 = alan.recipes.create!(user_id: alan.id, name: "Alan's favorite", content: "Recipe instructions would go here.", preptime: "20", servings: "4",
  :ingredient_ids => [whole_wheat_spaghetti.id, olive_oil.id, garlic.id, mushrooms.id, sea_salt.id, black_pepper.id, vegetable_broth.id, white_wine.id, parsley.id, bread_crumbs.id])

alan_recipe_2 = alan.recipes.create!(user_id: alan.id, name: "Alan's breakfast", content: "Recipe instructions would go here.", preptime: "2", servings: "1",
  :ingredient_ids => [cereal.id, almond_milk.id])

alan_recipe_3 = alan.recipes.create!(user_id: alan.id, name: "Alan's sandwich", content: "Recipe instructions would go here.", preptime: "5", servings: "1",
  :ingredient_ids => [bread.id, lettuce.id, tomato.id, veganaise.id])

jeff_recipe_1 = jeff.recipes.create!(user_id: jeff.id, name: "Parmesan Pita Crisps", content: "Recipe instructions would go here.", preptime: "15", servings: "4",
  :ingredient_ids => [pita_pockets.id, olive_oil.id, sea_salt.id, nutritional_yeast.id])

jeff_recipe_2 = jeff.recipes.create!(user_id: jeff.id, name: "Caprese Skewers", content: "Recipe instructions would go here.", preptime: "20", servings: "6",
  :ingredient_ids => [tofu.id, olive_oil.id, sea_salt.id, black_pepper.id, cherry_tomatoes.id, basil.id, balsamic_vinegar.id])

jeff_recipe_3 = jeff.recipes.create!(user_id: jeff.id, name: "Fried Zucchini", content: "Recipe instructions would go here.", preptime: "20", servings: "6",
  :ingredient_ids => [flour.id, sea_salt.id, almond_milk.id, canola_oil.id, zucchini.id, bread_crumbs.id])

chloe_recipe_1 = chloe.recipes.create!(user_id: chloe.id, name: "Lemony Chickpea Puree", content: "Recipe instructions would go here.", preptime: "10", servings: "6",
  :ingredient_ids => [chickpeas.id, olive_oil.id, lemon_juice.id, capers.id, cayenne.id, sea_salt.id, black_pepper.id])

chloe_recipe_2 = chloe.recipes.create!(user_id: chloe.id, name: "Pepper Crostini", content: "Recipe instructions would go here.", preptime: "10", servings: "6",
  :ingredient_ids => [olive_oil.id, bell_pepper.id, sea_salt.id, black_pepper.id, baguette.id])

chloe_recipe_3 = chloe.recipes.create!(user_id: chloe.id, name: "Roasted Cauliflower", content: "Recipe instructions would go here.", preptime: "45", servings: "4",
  :ingredient_ids => [cauliflower.id, onion.id, sea_salt.id, garlic.id, thyme.id, olive_oil.id, black_pepper.id])
