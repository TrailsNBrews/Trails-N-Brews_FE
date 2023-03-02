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
  
  describe 'sad path testing' do
    it 'returns an error when no results match' do
      json_response = File.read('spec/fixtures/colorado_breweries.json')
      stub_request(:get, "https://evening-caverns-30828.herokuapp.com/api/v1/search_breweries?name=cheese").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.7.4'
           }).
         to_return(status: 200, body: "", headers: {})
     
       # registered request stubs:
       # 
       # stub_request(:get, "https://evening-caverns-30828.herokuapp.com/api/v1/search_breweries")
  
        visit breweries_path
        fill_in(:name, with: "cheese")
        click_button 'Find Brewery'
        
        # save_and_open_page
        
        expect(current_path).to eq(breweries_path)
        expect(page).to have_content("Search returned no results")
    end
  end
  
end