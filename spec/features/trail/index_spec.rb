require 'rails_helper'

RSpec.describe 'trails index' do
  xit 'has a search bar to search trails' do
    visit trails_path

    expect(page).to have_content()
  end
end