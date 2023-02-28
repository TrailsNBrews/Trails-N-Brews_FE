require 'rails_helper'

RSpec.describe "brewery index" do

  it 'can search for breweries' do

    json_response = File.read('spec/fixtures/colorado_breweries.json')
    stub_request(:get, "https://evening-caverns-30828.herokuapp.com/api/v1/search_breweries?name=barrel")
      .to_return(status: 200, body: json_response)

    visit breweries_path

    fill_in(:name, with: "barrel")
    click_button 'Find Brewery'

    expect(current_path).to eq(breweries_path)
    expect(page).to have_content("10 Barrel Brewing Co")
  end

  it 'can take me to a brewery show page' do 

    json_response = File.read('spec/fixtures/colorado_breweries.json')
    stub_request(:get, "https://evening-caverns-30828.herokuapp.com/api/v1/search_breweries?name=barrel")
      .to_return(status: 200, body: json_response)

      visit breweries_path

    json_response = File.read('spec/fixtures/10-barrel-brewing-company.json')
    stub_request(:get, "https://evening-caverns-30828.herokuapp.com/api/v1/search_breweries/10-barrel-brewing-co-denver-denver")
      .to_return(status: 200, body: json_response)
      
    fill_in(:name, with: "barrel")
    click_button 'Find Brewery'

    click_link "10 Barrel Brewing Co - Denver"

    expect(current_path).to eq(brewery_path("10-barrel-brewing-co-denver-denver"))
  end
end