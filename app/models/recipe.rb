class Recipe < ApplicationRecord
	has_many :ingredients , through: :recipe_ingredients
	belongs_to :user # Starting with Rails 5, belongs_to relationships have a required value by default
	has_many :recipe_ingredients

	# def ingredient_attributes=(attributes)
	# 	binding.pry
	# end
 accepts_nested_attributes_for :ingredients, allow_destroy: true
 #reject_if: proc {|attributes| attributes['name'].blank?}
 # def categories_attributes=(category_attributes)
 #    category_attributes.values.each do |category_attribute|
 #      category = Category.find_or_create_by(category_attribute)
 #      self.categories << category
 #    end
 #  end
 def ingredients_attributes=(attributes)
  attributes.values.each do |att|
    # binding.pry
    ingredient = Ingredient.find_or_create_by(att)
    self.ingredients<< ingredient
    end 
 end
end


# recipes#index
# recipes#new
# exitrecipes#create
# recipes#show