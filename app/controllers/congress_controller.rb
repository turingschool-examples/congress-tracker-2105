class CongressController < ApplicationController
  def search
    @found_senator = CongressFacade.find_senator_by_last_name(params[:search])
  end

  def search_state
    @state = params[:state]
    @house_members = CongressFacade.find_all_house_members_by_state(params[:state])
  end
end
