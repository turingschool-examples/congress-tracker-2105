class UsersController < ApplicationController
    def new 
        @user = User.new
    end 

    def create
        user = user_params
        user[:username] = user[:username].downcase
        new_user = User.create(user)
        if new_user.save
            session[:user_id] = new_user.id
            flash[:success] = "Welcome, #{new_user.username}!"
        end 
        redirect_to root_path
    end

    private 

    def user_params 
        params.require(:user).permit(:username, :password)
    end 
end 