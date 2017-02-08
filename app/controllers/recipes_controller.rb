class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :favorite]
  rescue_from ActiveRecord::RecordNotFound, with: :show_errors

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.create(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def show
    @rating = Rating.new
    @comment = Comment.new
    @recipe = Recipe.find(params[:id])
      respond_to do |format|
      format.html { render :show }
      format.json { render json: @recipe }
    end
  end

  def index
    @recipes = Recipe.all
  end

  def edit
    authorize! :edit, @recipe
  end

  def update
    authorize! :update, @recipe
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def highest_rated
    @recipes = Recipe.all
  end

  def favorite
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @recipe
      redirect_to :back, notice: "You have favorited #{@recipe.name}"
    elsif type == "unfavorite"
      current_user.favorites.delete(@recipe)
      redirect_to :back, notice: "You have unfavorited #{@recipe.name}"
    else
      redirect_to :back
    end
  end

  private

  def show_errors
    flash[:error] = "Oops, we cannot find that record. Please select a recipe from the list."
    redirect_to recipes_path
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :content, :preptime, :servings, :photos_attributes => [:image],
      :ingredients_attributes => [:name], :ingredient_ids => [])
  end

end

