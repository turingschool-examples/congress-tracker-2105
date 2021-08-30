class CongressFacade 
    def self.find_senator_by_last_name(last_name) 
        json = CongressService.get_senate_members
        
        senators = json[:results].first[:members].map do |senator| 
            SenateMember.new(senator)
        end 
    
        senators.find do |senator|
            senator.last_name == last_name
        end
    end 
end 