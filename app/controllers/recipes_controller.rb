class RecipesController < ApplicationController
  def index
  	@recipes=Recipe.all
  end

  def new  #get
    @recipe=Recipe.new()
    # @ingredients=5.times{Ingredient.new}
    @ingredients = (1..5).to_a.collect{@recipe.ingredients.build}
  #  i=0
  #  while(i<5){@ingredients[i]=Ingredient.new
   #   i+=1}
  end

#If i create Kebab with Meat, Salt, and Onion
# and You create Ayedh's Kebab with Chicken, Pepper, and lettuce

# its very loud there. can you still hear me?

  def create #POST
    # raise.params.inspect
    raise recipe_params.inspect
    # params[:recipe] = {name: "Kebab", id: 12 , ingredient:[name]}
    
    # add more ingredient fields to the new form
    # create a new recipe and associate ingredients
    # we want to be able to create a recipe with 0-5 ingredients
    @recipe=Recipe.create(params[:recipe])
    if @recipe
      @ingredient = Ingredient.all.find {|ingredient| ingredient.name == params[:ingredient_names][:name] }
      if !@ingredient
        render 'show'
      else 
        redirect_to 'recipe/new'
      end
    end
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