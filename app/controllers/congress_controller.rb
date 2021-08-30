class CongressController < ApplicationController
  def search
    @found_senator = CongressFacade.find_senator_by_last_name(params[:search])
  end

  def search_state
    state = params[:state]
    conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = ENV['PROPUBLICA_API_KEY']
    end

    response = conn.get("/congress/v1/members/house/#{state}/current.json")

    json = JSON.parse(response.body, symbolize_names: true)

    @house_members = json[:results]
  end
end
