require 'rails_helper'

RSpec.describe 'Welcome page' do
  it 'displays a welcome page' do
    visit root_path
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Trails N' Brews")
  end
end