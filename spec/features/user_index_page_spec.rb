require 'rails_helper'

RSpec.describe 'User', type: :feature do
  describe 'index page' do
    it 'Shows the username of the users.' do
      visit '/users'
      expect(page).to have_css('.user-name')
    end

    it 'Shows the profile picture of the users.' do
      visit '/users'
      expect(page).to have_css('.photo-container')
    end

    it 'Shows the number of posts of the users.' do
      visit '/users'
      expect(page).to have_css('.posts_counter')
    end

    it 'Redirects me to the user profile page when I click its name' do
      visit '/users'
      click_on 'Miguel'
      expect(page).to have_css('.bio-container')
    end
  end
end