class Admin::RecipesController < Admin::Base

  def index
    @recipes = Recipe.all
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

end
