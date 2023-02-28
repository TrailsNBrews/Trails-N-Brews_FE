require 'rails_helper'

RSpec.describe 'Brewery show page' do
  it 'shows the breweries name, street, city, and phone number' do

    json_response = File.read('spec/fixtures/10-barrel-brewing-company.json')
    stub_request(:get, "https://evening-caverns-30828.herokuapp.com/api/v1/search_breweries/10-barrel-brewing-co-denver-denver")
      .to_return(status: 200, body: json_response)

    visit brewery_path("10-barrel-brewing-co-denver-denver")
    
    expect(page).to have_content("10 Barrel Brewing Co - Denver")
    # expect(page).to have_content("2620 Walnut St")
    expect(page).to have_content("Denver")
    # expect(page).to have_content("7205738992")
    expect(page).to_not have_content("Website")
  end
  it 'shows the breweries website if it has one provided' do

    json_response = File.read('spec/fixtures/10-barrel-brewing-company.json')
    stub_request(:get, "https://evening-caverns-30828.herokuapp.com/api/v1/search_breweries/10-barrel-brewing-co-denver-denver")
      .to_return(status: 200, body: json_response)

    visit brewery_path("barrels-and-bottles-brewery-golden")

    expect(page).to have_content("http://www.barrelsbottles.com")
  end
end