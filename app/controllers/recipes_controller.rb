class RecipesController < ApplicationController

  def index
  	@recipes=Recipe.all
  end

  def new  #get
    @recipe = current_user.recipes.build
    # @ingredients = (1..5).to_a.collect{@recipe.ingredients.build}
    5.times { @recipe.ingredients.build }
  end

  def create   #POST
    # raise recipe_params.inspect
    @recipe=current_user.recipes.build(recipe_params)
    # @recipe.user_id = current_user.id
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

  def edit
    @recipe = current_user.recipes.find_by(recipe_params)
  end

  def update
    @recipe=current_user.recipes.find_by(recipe_params)
    # @recipe.user_id = current_user.id
    if @recipe.update_attributes(recipe_params)
      redirect_to recipe_path(@recipe) , :notice => "Your recipe was Updated"
    else
      @errors = @recipe.errors.full_messages
      render "edit"
    end
  end
  def destroy 
        raise recipe_params.inspect
# 
    @recipe=current_user.recipes.find_by(recipe_params)
    @recipe.destroy
    redirect_to recipes_path , :notice => "Your recipe #{@recipe.name} deleted"
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredients_attributes: [:name] )
  end
end
