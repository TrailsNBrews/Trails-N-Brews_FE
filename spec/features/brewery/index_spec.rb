require 'rails_helper'

RSpec.describe "brewery index" do

  it 'can search for breweries' do

    json_response = File.read('spec/fixtures/colorado_breweries.json')
    stub_request(:get, "https://api.openbrewerydb.org/breweries?by_state=colorado&per_page=10")
      .to_return(status: 200, body: json_response)

    visit breweries_path

    fill_in(:name, with: "10 Barrel Brewing Co")
    click_button 'Find Brewery'

    expect(current_path).to eq(breweries_path)
    expect(page).to have_content("10 Barrel Brewing Co")
    save_and_open_page
  end
end