class UsersController < ApplicationController
  def show

  end

  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.create(user)
    session[:user_id] = new_user.id
    flash[:message] = "Welcome #{new_user.email}!"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
