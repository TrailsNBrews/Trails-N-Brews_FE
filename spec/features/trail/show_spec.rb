require 'rails_helper'

RSpec.describe "Trails show" do
  # before(:each) do
  #   User.create
  # end

  it 'has the trails name and attributes' do
    json_response = File.read('spec/fixtures/buffalo_trailhead_62818.json')
    stub_request(:get, "https://evening-caverns-30828.herokuapp.com/api/v1/search_trails/62818")
      .to_return(status: 200, body: json_response)

    visit trail_path(62818)
    
    expect(page).to have_content("Buffalo (Colorado Trail) Trailhead")
  end

  # it 'can add trail to favorites list' do
  #   WebMock.allow_net_connect!
  #   visit trail_path("207495")

  #   expect(page).to have_button("Add to Favorites")

  #   click_on("Add to Favorites")

  #   expect(page).to have_button("Add to Favorites", disabled: true)
  #   WebMock.disable_net_connect!
  # end
end