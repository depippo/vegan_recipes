class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :show_errors

  def show
    @user = User.find(params[:id])
      respond_to do |format|
      format.html { render :show }
      
    end
  end

  def index
    @users = User.all
  end

  def data
    user = User.find(params[:id])
    render json: UserSerializer.serialize(user)
  end

  private

  def show_errors
    flash[:error] = "Oops, we cannot find that record. Please select a user from the list."
    redirect_to users_path
  end

end