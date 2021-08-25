class SessionsController <ApplicationController
    def new 
    end 

    def create
        found_user = User.find_by(username: params[:username])
        if found_user.authenticate(params[:password])
            session[:user_id] = found_user.id
            flash[:success] = "Welcome, #{found_user.username}!"
            redirect_to root_path if current_user.default?
            redirect_to admin_dashboard_path if current_user.admin?
        else 
            flash[:failure] = "Credentials were bad. Try again."
            redirect_to login_path
        end 
    end 

    def destroy 
        session[:user_id] = nil
        redirect_to root_path
    end 
end 