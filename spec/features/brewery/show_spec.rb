require 'rails_helper'

RSpec.describe 'Brewery show page' do
  it 'shows the breweries name' do

    json_response = File.read('spec/fixtures/10-barrel-brewing-company.json')
    stub_request(:get, "https://api.openbrewerydb.org/breweries/10-barrel-brewing-co-denver-denver")
      .to_return(status: 200, body: json_response)

    visit brewery_path("10-barrel-brewing-co-denver-denver")

    expect(page).to have_content("10 Barrel Brewing Co - Denver")
  end
end