require 'rails_helper'

RSpec.describe 'User', type: :system do
  before(:all) do
    user = User.new(
      name: 'joao',
      photo: 'somephoto',
      bio: 'somebio',
      email: 'something@hotmail.com',
      password: '123456'
    )
    user.skip_confirmation!
    user.save!
  end

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
      click_on 'joao'
      expect(page).to have_css('.bio-container')
    end
  end
end
