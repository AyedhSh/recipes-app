class Recipe < ApplicationRecord
	has_many :ingredients , through: :recipe_ingredients
	belongs_to :user # Starting with Rails 5, belongs_to relationships have a required value by default
	has_many :recipe_ingredients

 accepts_nested_attributes_for :ingredients, reject_if: proc {|attributes| attributes['name'].blank? }, allow_destroy: true 


 def ingredients_attributes=(attributes)
  attributes.values.each do |att|
    # binding.pry
    ingredient = Ingredient.find_or_create_by(att)
    self.ingredients<< ingredient
    end 
 end
end


