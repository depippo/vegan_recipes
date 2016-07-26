class RatingsController < ApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])
    rating = Rating.new(:user_id => current_user.id, :score => params[:rating][:score])
    @recipe.ratings << rating
    @recipe.save
    redirect_to recipe_path(@recipe)
  end

end
