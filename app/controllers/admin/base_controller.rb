class Admin::BaseController < ApplicationController
  before_action :require_admin

  private

  def require_admin
    unless current_admin?
      flash[:error] = "Your permissions are bad and you should feel bad"
      redirect_to root_path 
    end
  end
end
