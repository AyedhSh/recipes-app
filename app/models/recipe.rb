class Recipe < ApplicationRecord
	has_many :ingredients , through: :recipe_ingredients
	belongs_to :user # Starting with Rails 5, belongs_to relationships have a required value by default
	has_many :recipe_ingredients

 accepts_nested_attributes_for :ingredients, reject_if: proc {|attributes| attributes['name'].blank? }, allow_destroy: true 

# mount_uploader :image_url , PlacephotoUploader

 has_attached_file :image_url , style: {large: "600x600>", medium: "300x300>" , thumb: "150x150#" }
 validates_attachment_content_type :image_url, content_type: /\Aimage\/.*\z/

 def ingredients_attributes=(attributes)
  attributes.values.each do |att|
    # binding.pry
    ingredient = Ingredient.find_or_create_by(att)
    self.ingredients<< ingredient
    end 
 end
end


