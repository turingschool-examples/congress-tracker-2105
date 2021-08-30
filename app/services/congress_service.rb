class CongressService 
    def self.get_senate_members
        response = Faraday.get('https://api.propublica.org/congress/v1/117/senate/members.json') do |req|
            req.headers['X-API-KEY'] = ENV['PROPUBLICA_API_KEY']
        end
        json = JSON.parse(response.body, symbolize_names: true)
    end 
end 