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

  it 'has a button that takes me to the users accomplishments page' do
    user_params = ({
      first_name: 'Jimmy',
      last_name:  'Jimmington',
      email: 'jim@email.com',
      google_id: '1346464641',
      google_token: 'dj6s5f4sl5fj'
    })
    BackendService.user_create_or_find(user_params)

    visit user_path

    expect(page).to have_button("Accomplishments")

    click_on "Accomplishments"

    expect(current_path).to eq(user_accomplishments_path)
  end
end
