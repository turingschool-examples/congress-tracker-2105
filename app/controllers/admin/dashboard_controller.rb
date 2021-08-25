class Admin::DashboardController <ApplicationController
    before_action :require_admin

    def index 

    end 

    private 

    def require_admin
        if current_user && !current_user.admin? 
            flash[:alert] = "You're not authorized to be here."
            redirect_to root_path
        end 
    end 
end 