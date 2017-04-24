class RecipesController < ApplicationController
  def index
  	@recipes=Recipe.all
  end

  def new  #get
    @recipe=Recipe.new()
    @ingredients = (1..5).to_a.collect{@recipe.ingredients.build}
  end

#If i create Kebab with Meat, Salt, and Onion
# and You create Ayedh's Kebab with Chicken, Pepper, and lettuce

  def create   #POST
    # raise.params.inspect
    @recipe=Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
    redirect_to recipe_path(@recipe) , :notice => "Your recipe was saved"
  else
    render "new"
  end
  end

  def show
  	# binding.pry
  	@recipe=Recipe.find_by(id: params[:id])
     
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name,ingredients_attributes: [:name] )
  end
end
# GET '/recipes/1'
# routes => RecipesController#show
# view show.html.erb