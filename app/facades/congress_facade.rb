class CongressFacade 
    def self.find_senator_by_last_name(last_name) 
        all_senators.find do |senator|
            senator.last_name == last_name
        end
    end 

    def self.all_senators 
        CongressService.get_senate_members[:results].first[:members].map do |senator| 
            SenateMember.new(senator)
        end 
    end 

    def self.find_all_house_members_by_state(state)
        json = CongressService.house_members(state)
        json[:results].map do |house_member_data| 
            HouseMember.new(house_member_data)
        end 
    end 
end 