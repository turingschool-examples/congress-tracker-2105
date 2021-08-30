require 'rails_helper'

describe CongressService do
  describe "class methods" do
    describe "#get_senate_members" do
      it "returns senate member data" do
        response_body = File.read('spec/fixtures/senators.json')

        stub_request(:get, "https://api.propublica.org/congress/v1/117/senate/members.json").
        to_return(status: 200, body: response_body, headers: {})

        response = CongressService.get_senate_members

        expect(response).to be_a Hash
        expect(response[:results].first[:members]).to be_an Array
        senate_member_data = response[:results].first[:members].first

        expect(senate_member_data).to have_key :first_name
        expect(senate_member_data[:first_name]).to be_a(String)

        expect(senate_member_data).to have_key :last_name
        expect(senate_member_data[:last_name]).to be_a(String)

        expect(senate_member_data).to have_key :twitter_account
        expect(senate_member_data[:twitter_account]).to be_a(String)
      end
    end
  end
end