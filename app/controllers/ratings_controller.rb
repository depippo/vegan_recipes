class RatingsController < ApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])
    rating = Rating.new(:score => params[:rating][:score])
    @recipe.ratings << rating
    @recipe.save
    redirect_to recipe_path(@recipe)
  end

#  def update
#    @rating = Rating.find(params[:id])
#    @rating.update_attribute :score, params[:score]
#  end

end