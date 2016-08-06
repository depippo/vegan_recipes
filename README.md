# Vegan Recipes

This is a rails app designed for sharing vegan recipes. It allows you to upload recipes of your own, or browse through recipes submitted by others.

## Instructions

To get started, clone or download the repository. Run bundle install in your terminal to make sure all necessary gems are installed. Then run rake rb:migrate, and, if you would like to see some example recipe entries, run rake db:seed. Finally, start the server with rails s, and navigate to http://localhost:3000/ in your browser.

You will need to sign up before you can do anything. Once you're registered, you can click Recipes in the navigation bar to see all submitted recipes. You can click on any one of the recipe names to view the recipe's details. There is also a link on this page to "add a new recipe." Just fill in all the required fields and click "Create Recipe", and your recipe will be added to the database.

You can also navigate to the Ingredients page to see a list of all ingredients in the database. From here, you have the option to add a new ingredient, or click on any of the existing ingredients to see all of the recipes it is used in.

When viewing a recipe's page, you have the option of submitting a score for it. To see a list of the recipes that have the recveived the highest average score, click on Highest Rated Recipes in the navigation bar.