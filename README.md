# Recip App

## What is this for?

Simple recipe app to practice building a small Rails site with associations.

## Getting Started:

-- To be filled in by Ayedh. This section should give anyone looking at this repo all the information they would need to run this site locally on their own computer. --
- Step 1
- Step 2
- Step 3
...
..
.

## What It Should Do:

- [ ] Allow users to create recipes with associated ingredients
 - [ ] User goes to `/recipe/new` and fills out form with recipe name and ingredient names
 - [ ] Form posts to `/recipes`, creates a new recipe, and finds or creates needed ingredients and associates them to the recipe. Ideally this will be done with `Recipe.new(recipe_params)` and `Recipe` will have the instance method `#ingredient_attributes` to handle this. But this can also be done in many lines in the controller (not as good) - This lab may be hepful: https://learn.co/tracks/full-stack-web-development/rails/associations-and-rails/has-many-through-in-forms
- [ ] User can view all recipes at `/recipes`
- [ ] User can view specific recipe at `/recipes/:id`
- [ ] Allow users to update recipes by adding/removing ingredients
- [ ] Optional: Allow users to be able to set _amount_ of ingredient needed for each recipe
- [ ] Optional: Add login and authentication to allow users to only modify _their own_ recipes
 - [ ] Bcrypt? Devise?

## Domain Notes

- Ingredients should unique in the database. We do not want 100 instances of 'Onion'
