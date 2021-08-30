require 'rails_helper'

describe 'CongressFacade' do
  it 'can find one senate member from search' do
    response_body = File.read('spec/fixtures/senators.json')

    stub_request(:get, "https://api.propublica.org/congress/v1/117/senate/members.json").
    to_return(status: 200, body: response_body, headers: {})
    
    senator = CongressFacade.find_senator_by_last_name("Baldwin")

    expect(senator).to be_a(SenateMember)
    expect(senator.last_name).to eq("Baldwin")
  end
end