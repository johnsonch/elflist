class UserController < ApplicationController
  before_action :show_params

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end


  private
  def show_params
    puts params[:user].inspect
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
