class PhotosController < ApplicationController

  def index
    if params[:recipe_id]
      @recipe = Recipe.find(params[:recipe_id])
      @photos = Recipe.find(params[:recipe_id]).photos
    else
      @photos = Photo.all
    end
  end

  def show
    if params[:recipe_id]
      @photo = Photo.find(params[:id])
    else
      @photo = Photo.find(params[:id])
    end
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @photo = Photo.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    photo = Photo.new(photo_params)
    @recipe.photos << photo
    @recipe.save
    redirect_to recipe_path(@recipe)
  end

  private

  def photo_params
    params.require(:photo).permit(:image)
  end

end