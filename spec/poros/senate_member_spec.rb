require 'rails_helper'

describe 'SenateMember' do
  it 'abstracts and encapsulates senate member data that can be read' do
    senate_member_info = {
        "id": "B001230",
        "title": "Senator, 1st Class",
        "short_title": "Sen.",
        "api_uri":"https://api.propublica.org/congress/v1/members/B001230.json",
        "first_name": "Tammy",
        "middle_name": nil,
        "last_name": "Baldwin",
        "suffix": nil,
        "date_of_birth": "1962-02-11",
        "gender": "F",
        "party": "D",
        "leadership_role": "Senate Democratic Caucus Secretary",
        "twitter_account": "SenatorBaldwin",
        "facebook_account": "senatortammybaldwin",
        "youtube_account": "witammybaldwin",
        "govtrack_id": "400013",
        "cspan_id": "57884",
        "votesmart_id": "3470",
        "icpsr_id": "29940",
        "crp_id": "N00004367",
        "google_entity_id": "/m/024v02",
        "fec_candidate_id": "H8WI00018",
        "url": "https://www.baldwin.senate.gov",
        "rss_url": "https://www.baldwin.senate.gov/rss/feeds/?type=all",
        "contact_form": "https://www.baldwin.senate.gov/feedback",
        "in_office": true,
        "cook_pvi": nil,
        "dw_nominate": -0.493,
        "ideal_point": nil,
        "seniority": "9",
        "next_election": "2024",
        "total_votes": 252,
        "missed_votes": 0,
        "total_present": 0,
        "last_updated": "2021-06-25 07:36:55 -0400",
        "ocd_id": "ocd-division/country:us/state:wi",
        "office": "709 Hart Senate Office Building",
        "phone": "202-224-5653",
        "fax": nil,
        "state": "WI",
        "senate_class": "1",
        "state_rank": "junior",
        "lis_id": "S354",
        "missed_votes_pct": 0.00,
        "votes_with_party_pct": 99.21,
        "votes_against_party_pct": 0.79
      }
  senate_member =  SenateMember.new(senate_member_info)

  expect(senate_member.first_name).to eq "Tammy"
  expect(senate_member.last_name).to eq "Baldwin"
  expect(senate_member.twitter_account).to eq "SenatorBaldwin"
  end
end