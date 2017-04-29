class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show , :edit , :update , :destroy]

  
  def index
  	@recipes=Recipe.all
  end

  def new  #get
    @recipe = current_user.recipes.build
    5.times { @recipe.ingredients.build }
  end

  def create   #POST
    # raise recipe_params.inspect
    @recipe=current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe) , :notice => "Your recipe was saved"
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

    def update

     if @recipe.update_attributes(recipe_params)
      redirect_to recipe_path(@recipe) , :notice => "Your recipe was Updated"
    else
      @errors = @recipe.errors.full_messages
      render "edit"
    end
  end

  def destroy 
    # raise recipe_params.inspect
    @recipe.destroy
    redirect_to recipes_path , :notice => "Your recipe #{@recipe.name} deleted"
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name,:image, ingredients_attributes: [:name] )
  end

  def find_recipe
   @recipe=Recipe.find_by(id: params[:id])
 end
end
