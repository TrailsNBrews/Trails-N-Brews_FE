require 'rails_helper'

RSpec.describe 'user accomplishments' do
  it 'displays what trails and breweries the user has completed' do
    WebMock.allow_net_connect!
    visit user_accomplishments_path

    expect(page).to have_content("Completed Trails")
    expect(page).to have_content("Breweries Visited")
    WebMock.disable_net_connect!
  end
end
