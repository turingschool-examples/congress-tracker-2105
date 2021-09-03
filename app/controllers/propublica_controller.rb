class PropublicaController < ApplicationController

  def search
    member_search = params[:search]
    conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = ENV['GOVT_API']
    end
    response = conn.get('/congress/v1/116/senate/members.json')

    json = JSON.parse(reponse.body, symbolize_names: true)
    @members = json[:results][0][:members]

    found_member = @members.find {|m| m[:last_name] == member_search}
    binding.pry
  end
end  
