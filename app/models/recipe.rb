class Recipe < ApplicationRecord
	has_many :ingredients , through: :recipe_ingredients
	belongs_to :user
	has_many :recipe_ingredients

	# def ingredient_attributes=(attributes)
	# 	binding.pry
	# end
 accepts_nested_attributes_for :ingredients, allow_destroy: true
end


# recipes#index
# recipes#new
# exitrecipes#create
# recipes#show