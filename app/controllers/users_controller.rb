class UsersController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Thank you for unlocking your Satchel."
      redirect_to user_path(@user)
    else
      flash[:alert] = "We experienced a difficulty signing you in. Please try again."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
