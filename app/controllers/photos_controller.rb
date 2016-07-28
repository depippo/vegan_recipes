class PhotosController < ApplicationController

  def index
    if params[:recipe_id]
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
    @photo = Photo.new
  end

  def create
    uploaded_io = params[:photo][:image]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to photos_path
    else
      render 'new'
    end
  end

  def photo_params
    params.require(:photo).permit(:image)
  end

end