class Admin::RecipesController < Admin::Base

  def index
    @recipes = Recipe.all
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      redirect_to :admin_recipes
    else
      render "index"
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.assign_attributes(params[:recipe])
    if @recipe.save
      redirect_to :admin_recipes
    else
      render "index"
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to :admin_recipes
  end

end
