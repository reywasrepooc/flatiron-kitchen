class RecipesController < ApplicationController
  before_action :find_recipe, only: [:edit, :update]
  before_action :get_ingredients, only: [:new, :edit]

  def new
    @recipe = Recipe.new
  end

  def index
    @recipes = Recipe.all
  end

  def create
    recipe = Recipe.new(recipe_params)
    if recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  def update
    @recipe.update(recipe_params)
    if @recipe.save
      redirect_to recipes_path
    else
      render :edit
    end
  end

  def edit
  end

  private

  def get_ingredients
    @ingredients = Ingredient.all
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end

end
