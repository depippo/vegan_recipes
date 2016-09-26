class NutrientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :show_errors

  def show
    @nutrient = Nutrient.find(params[:id])
  end

  def index
    @nutrients = Nutrient.all.sort_by(&:name)
  end

  def new
    @nutrient = Nutrient.new
  end

  def create
    @nutrient = Nutrient.where(name: nutrient_params[:name].downcase).first_or_create
    if @nutrient.save
      redirect_to nutrient_path(@nutrient)
    else
      render :new
    end
  end

  private

  def show_errors
    flash[:error] = "Oops, we cannot find that record. Please select an ingredient from the list."
    redirect_to nutrients_path
  end

  def nutrient_params
    params.require(:nutrient).permit(:name)
  end
end
