require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before(:all) do
    user = User.new(
      name: 'Miguel',
      photo: 'photo.png',
      bio: 'im Miguel',
      email: 'test@gmail.com',
      password: '1234567'
    )
    user.skip_confirmation!
    user.save!
  end

  describe 'Login page' do
    it 'Shows inputs for email and password' do
      visit '/users/sign_in'
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
      expect(page).to have_button('Log in')
    end

    it 'Returns a detailed error when I click with no inputs' do
      visit '/users/sign_in'
      click_on 'Log in'
      expect(page).to have_css('.alert', text: 'Invalid Email or password.')
    end

    it 'Returns a detailed error when I click with wrong inputs' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'something@hotmail.com'
      fill_in 'Password', with: '3'
      click_on 'Log in'
      expect(page).to have_css('.alert', text: 'Invalid Email or password.')
    end

    it 'Logs me in and sends me to root if inputs are right' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: '1234567'
      click_on 'Log in'
      expect(page).to have_selector('section', id: 'users')
    end
  end
end