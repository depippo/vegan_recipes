class IngredientsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :show_errors

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
     @ingredient = Ingredient.where(name: ingredient_params[:name].downcase).first_or_create(ingredient_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render :new
    end
end

  private

  def show_errors
    flash[:error] = "Oops, we cannot find that record. Please select an ingredient from the list."
    redirect_to ingredients_path
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :nutrients_attributes => [:name], :nutrient_ids => [])
  end

end
