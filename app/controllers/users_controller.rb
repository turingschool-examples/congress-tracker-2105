class UsersController <ApplicationController 
    def new 
        @user = User.new
    end 

    def create
        user = user_params
        user[:username] = user[:username].downcase
        new_user = User.create(user)
        if new_user.save
            # require 'pry';binding.pry
            flash[:success] = "Welcome, #{new_user.username}!"
            redirect_to root_path
        end 
    end

    def login_form 
    end 

    def authenticate_user
        # find user with that username
        found_user = User.find_by(username: params[:username])
        # check if the password that was passed in is the same as the one that was stored for that user
        # if the users credentials are valid 
        if found_user.authenticate(params[:password])
            #     then redirect to root page and show welcome message 
            flash[:success] = "Welcome, #{found_user.username}!"
            redirect_to root_path
        else 
            flash[:failure] = "Credentials were bad. Try again."
            redirect_to login_path
        end 
    end 
      
    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end 