class RecipeIngredient < ApplicationRecord
belongs_to :recipe
belongs_to :ingredient

end
# avi
# avi.recipes => <#ARACP []>
# avi.recipes.create()