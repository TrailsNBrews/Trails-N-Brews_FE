require 'rails_helper'

RSpec.describe 'Welcome page' do
  before :each do
    visit root_path
  end
  
  it 'displays a welcome page' do
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Trails N' Brews")
    expect(page).to have_link("Sign in/Sign up with Google")
  end
  
  describe 'navigation bar' do
    it 'has links' do
      expect(page).to have_link("Home")
      expect(page).to have_link("Trails")
      expect(page).to have_link("Breweries")
      expect(page).to have_link("Contact")
      expect(page).to have_link("Profile")
      expect(page).to have_link(href: "https://github.com/TrailsNBrews")
    end
    
    it 'Home link works' do
      click_on "Home"
      expect(current_path).to eq("/")
    end
    
    it 'Trails link works' do
      click_on "Trails"
      expect(current_path).to eq("/trails")
    end
    
    it 'Breweries link works' do
      click_on "Breweries"
      expect(current_path).to eq("/breweries")
    end
    
    it 'Profile link works' do
      click_on "Profile"
      expect(current_path).to eq("/user")
    end
    
    it 'Contact link works' do
      expect(page).to have_link(:Contact, href: "https://github.com/orgs/TrailsNBrews/people")
    end
  end
end
