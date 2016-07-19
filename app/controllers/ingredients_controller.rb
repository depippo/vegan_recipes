class IngredientsController < ApplicationController

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @Ingredient = Ingredient.create(ingredient_params)
    redirect_to ingredient_path(@Ingredient)
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
