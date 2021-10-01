class IngredientsController < ApplicationController
  before_action :find_ingredient, only: [:edit, :update]

  def new
    @ingredient = Ingredient.new
  end

  def edit
  end

  def update
    @ingredient.update(ingredient_params)
    if @ingredient.save
      redirect_to ingredients_path
    else
      render :edit
    end
  end


  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def create
    ingredient = Ingredient.new(ingredient_params)
    if ingredient.save
      redirect_to ingredients_path
    else
      render :new
    end
  end

  private

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
