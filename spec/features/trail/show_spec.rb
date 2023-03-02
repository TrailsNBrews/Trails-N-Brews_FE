require 'rails_helper'

RSpec.describe "Trails show" do
  it 'has the trails name and attributes' do
    json_response = File.read('spec/fixtures/buffalo_trailhead_correct.json')
    stub_request(:get, "https://evening-caverns-30828.herokuapp.com/api/v1/search_trails/62818")
      .to_return(status: 200, body: json_response)

    visit trail_path(62818)
    
    expect(page).to have_content("Buffalo (Colorado Trail) Trailhead")
  end
end