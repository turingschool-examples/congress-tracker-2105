class SessionController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:message] = "Welcome #{user.email}!"
      redirect_to root_path
    else
      flash[:message] = "email or password is incorrect"
      render :new
    end
  end

  def destroy
    session.delete :user_id
    # or use session.clear to erase all session data
    flash[:message] = "You have been logged out"
    redirect_to root_path
  end
end