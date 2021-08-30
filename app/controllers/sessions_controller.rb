class SessionsController <ApplicationController
    def new 
    end 

    def create
        found_user = User.find_by(username: params[:username])
        if found_user && found_user.authenticate(params[:password])
            session[:user_id] = found_user.id
            flash[:success] = "Welcome, #{found_user.username}!"
            redirect_to root_path if current_user.default?
            redirect_to admin_dashboard_path if current_user.admin?
        else 
            flash[:error] = "Your username or password are incorrect"
            redirect_to "/login"
        end 
    end 

    def destroy
        session[:user_id] = nil
        redirect_to '/'
    end 
end 