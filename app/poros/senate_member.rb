class SenateMember 
    attr_reader :first_name, :last_name, :twitter_account
    def initialize(senate_info)
        @first_name = senate_info[:first_name]
        @last_name = senate_info[:last_name]
        @twitter_account = senate_info[:twitter_account]
    end 
end 