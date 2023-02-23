require 'rails_helper'

RSpec.describe 'Welcome page' do
  it 'displays a welcome page' do
    visit root_path
    expect(current_path).to eq(root_path)

    expect(page).to have_content("Trails N' Brews")
  end

  # it 'takes us to the Create New User page' do
  #   visit root_path

  #   click_button 'New User'

  #   expect(current_path).to eq(new_user_path)
  # end
end