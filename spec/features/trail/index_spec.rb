require 'rails_helper'

RSpec.describe 'trails index' do
  it 'has a search bar to search trails' do
    json_response = File.read('spec/fixtures/buffalo_trails.json')
    stub_request(:get, "https://evening-caverns-30828.herokuapp.com/api/v1/search_trails?search=Buffalo")
      .to_return(status: 200, body: json_response)

    visit trails_path
    fill_in(:name, with: "Buffalo")
    click_button 'Find Trails'

    expect(page).to have_content("Buffalo (Colorado Trail) Trailhead")
    expect(page).to have_content("Buffalo Ridge Trailhead")
    expect(page).to have_content("Buffalo Pass Trailhead")
  end

  it 'can take me to a trails show page' do
    json_response = File.read('spec/fixtures/buffalo_trails.json')
    stub_request(:get, "https://evening-caverns-30828.herokuapp.com/api/v1/search_trails?search=Buffalo")
      .to_return(status: 200, body: json_response)
      
    visit trails_path
    fill_in(:name, with: "Buffalo")
    click_button 'Find Trails'

    json_response = File.read('spec/fixtures/buffalo_trailhead_63243.json')
    stub_request(:get, "https://evening-caverns-30828.herokuapp.com/api/v1/search_trails/63243")
      .to_return(status: 200, body: json_response)

    click_link "Buffalo Ridge Trailhead"
    expect(current_path).to eq(trail_path(63243))
  end
  
  describe 'sad path testing' do
    it 'returns an error when no results match' do
      json_response = File.read('spec/fixtures/no_trail_results.json')
      
      stub_request(:get, "https://evening-caverns-30828.herokuapp.com/api/v1/search_trails?search=cheese").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.7.4'
           }).
         to_return(status: 200, body: json_response, headers: {})
  
      visit trails_path
      fill_in(:name, with: "cheese")
      click_button 'Find Trails'
  
      expect(current_path).to eq(trails_path)
      expect(page).to have_content("Search returned no results")
    end
  end
end