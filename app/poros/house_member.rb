class HouseMember 
    attr_reader :name, :role, :party, :district

    def initialize(house_member_data)
       @name = house_member_data[:name]
       @role = house_member_data[:role]
       @party = house_member_data[:party]
       @district = house_member_data[:district]
    end 
end 