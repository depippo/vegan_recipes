class IngredientsController < ApplicationController

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def index
    @ingredients = Ingredient.all.sort_by(&:name)
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.where(name: ingredient_params[:name].downcase).first_or_create
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render :new
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
