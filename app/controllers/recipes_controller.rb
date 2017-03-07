class RecipesController < ApplicationController
  def index
  	@recipes=Recipe.all
  end

  def new  #get
    @recipe=Recipe.new()
    @ingredient=Ingredient.new
  end

  def create #POST
    raise.params.inspect
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
end
# GET '/recipes/1'
# routes => RecipesController#show
# view show.html.erb