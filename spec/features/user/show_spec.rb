require 'rails_helper'

RSpec.describe 'User show' do
  it 'displays a users name' do 
    visit user_path

    expect(current_path).to eq(user_path)

    expect(page).to have_content("User name")
    expect(page).to have_button("Find Trail")
    expect(page).to have_button("Find Brewery")

  end 

  it 'Find trail button takes us to the find trail page' do 
    visit user_path

    click_on "Find Trail"

    expect(current_path).to eq(trails_path)
  end

  it 'Find trail button takes us to the find breweries page' do 
    visit user_path

    click_on "Find Brewery"

    expect(current_path).to eq(breweries_path)
  end
end