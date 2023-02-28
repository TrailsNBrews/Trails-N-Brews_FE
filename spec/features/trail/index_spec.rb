require 'rails_helper'

RSpec.describe 'trails index' do
  it 'has a search bar to search trails' do

    json_response = File.read('spec/fixtures/buffalo-trails.json')
    stub_request(:get, "https://evening-caverns-30828.herokuapp.com/api/v1/search_trails?search=Buffalo")
      .to_return(status: 200, body: json_response)

    visit trails_path
    fill_in(:name, with: "Buffalo")
    click_button 'Find Trails'

    expect(page).to have_content("Buffalo (Colorado Trail) Trailhead")
  end

  it 'can take me to a trails show page' do

    json_response = File.read('spec/fixtures/buffalo-trails.json')
    stub_request(:get, "https://evening-caverns-30828.herokuapp.com/api/v1/search_trails?search=Buffalo")
      .to_return(status: 200, body: json_response)
      
    visit trails_path
    fill_in(:name, with: "Buffalo")
    click_button 'Find Trails'

    json_response = File.read('spec/fixtures/buffalo_trailhead.json')
    stub_request(:get, "https://evening-caverns-30828.herokuapp.com/api/v1/search_trails/62818")
      .to_return(status: 200, body: json_response)

    click_link "Buffalo (Colorado Trail) Trailhead"
    expect(current_path).to eq(trail_path(62818))
  end
end