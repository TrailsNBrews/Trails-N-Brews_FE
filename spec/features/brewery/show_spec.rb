require 'rails_helper'

RSpec.describe 'Brewery show page' do
  it 'shows the breweries name, street, city, and phone number' do

    json_response = File.read('spec/fixtures/10-barrel-brewing-company.json')
    stub_request(:get, "https://evening-caverns-30828.herokuapp.com/api/v1/search_breweries/10-barrel-brewing-co-denver-denver")
      .to_return(status: 200, body: json_response)

    visit brewery_path("10-barrel-brewing-co-denver-denver")
    
    expect(page).to have_content("10 Barrel Brewing Co - Denver")
    expect(page).to have_content("No address on file")
    expect(page).to have_content("Denver")
    expect(page).to have_content("(720) 573-8992")
    expect(page).to have_content("Website")
  end
  it 'shows the breweries website if it has one provided' do

    json_response = File.read('spec/fixtures/Barrels-and-bottles.json')
    stub_request(:get, "https://evening-caverns-30828.herokuapp.com/api/v1/search_breweries/barrels-and-bottles-brewery-golden")
      .to_return(status: 200, body: json_response)

    visit brewery_path("barrels-and-bottles-brewery-golden")

    expect(page).to have_content("http://www.barrelsbottles.com")
  end

  it 'can add brewery to favorites list' do
    WebMock.allow_net_connect!
    visit brewery_path("barrels-and-bottles-brewery-golden")

    expect(page).to have_button("Add to Favorites")

    click_on("Add to Favorites")

    expect(page).to have_button("Add to Favorites", disabled: true)
    WebMock.disable_net_connect!
  end
end
