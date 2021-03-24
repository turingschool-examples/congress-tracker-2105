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

  def login_form

  end

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:message] = "Welcome #{user.email}!"
      redirect_to root_path
    else
      flash[:message] = "email or password is incorrect"
      render :login_form
    end
  end

  def log_out
    session[:user_id] = nil
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
