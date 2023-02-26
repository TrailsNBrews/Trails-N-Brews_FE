require 'rails_helper'

RSpec.describe 'trails index' do
  it 'has a search bar to search trails' do

    json_response = File.read('spec/fixtures/buffalo-trails.json')
    stub_request(:get, "https://evening-caverns-30828.herokuapp.com/api/v1/search_trails?search=buffalo")
      .to_return(status: 200, body: json_response)

    visit trails_path

    fill_in(:name, with: "Buffalo")
    click_button 'Find Trails'

    expect(page).to have_content("Buffalo (Colorado Trail) Trailhead")
  end
end