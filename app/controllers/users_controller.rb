class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save 
      redirect_to @user
    else 
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = UserDecorator.new(User.find(params[:id]))
  end

  
private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end


end
