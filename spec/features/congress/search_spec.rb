require 'rails_helper'

RSpec.describe 'Search for members of congress' do
  # User visits the homepage
  # There's a search box to search for congress members by last name
  # When they fill it in with the name of current senator
  # Then they are taken to a search results page
  # And they see the name of the Senator that matches their search

  it 'Can search for members of congress' do

    response_body = File.read('spec/fixtures/senators.json')
    stub_request(:get, "https://api.propublica.org/congress/v1/117/senate/members.json").
            with(
              headers: {
             'Accept'=>'*/*',
             'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
             'User-Agent'=>'Faraday v1.5.0',
             'X-Api-Key'=> "xxhtODvy6FBCaBl8BM5d8SggVU417aRruASdTrRg"
              }).
              to_return(status: 200, body: response_body, headers: {})

    visit root_path

    fill_in :search, with: 'Boozman'
    click_button 'Search'

    expect(page.status_code).to eq 200
    expect(page).to have_content('Senator John Boozman')
    expect(page).to have_content("Twitter Handle: JohnBoozman")
  end
end
