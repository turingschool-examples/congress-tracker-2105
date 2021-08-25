class Admin::BaseController < ApplicationController 
    before_action :require_admin

    private 

    def require_admin
        if !current_admin?
            flash[:alert] = "You're not authorized to be here."
            redirect_to root_path
        end 
    end 
end 