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
    raise recipe_params.inspect
    # params[:recipe] = {name: "Kebab", id: 12 , ingredient:[name]}
    
    # add more ingredient fields to the new form
    # create a new recipe and associate ingredients
    # we want to be able to create a recipe with 0-5 ingredients
    @recipe=Recipe.create(recipe_params)
     
        redirect_to recipe_params_path
      
  end

  def show
  	# binding.pry
  	@recipe=Recipe.find_by(id: params[:id])
  	
  	if @recipe
  		@ingredients=@recipe.ingredients
  		render 'show'
    else
      redirect_to '/'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name)
  end
end
# GET '/recipes/1'
# routes => RecipesController#show
# view show.html.erb