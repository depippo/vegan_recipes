class IngredientsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :show_errors

  def show
    @ingredient = Ingredient.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @ingredient }
    end
  end

  def index
    @ingredients = Ingredient.all.sort_by(&:name)
  end

  def data
    ingredient = Ingredient.find(params[:id])
    render json: IngredientSerializer.serialize(ingredient)
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    ingredient_params[:name].downcase!
     @ingredient = Ingredient.where(name: ingredient_params[:name].downcase).first_or_create(ingredient_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render :new
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredient_params)
    redirect_to ingredient_path(@ingredient)
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
