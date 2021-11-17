require 'rails_helper'

RSpec.describe 'User', type: :system do
  before(:all) do
    @user = User.new(
      name:'joao', 
      photo:'somephoto', 
      bio:'somebio',
      email:'something2@hotmail.com',
      password:'123456',
    )
    @user.skip_confirmation!
    @user.save!
    x = 0
    while x < 3 do
      @user.posts.create(
        title:"post #{x}",
        text:"this is post's #{x} text"
      )
      x += 1
    end
  end

  describe 'show page' do
    it 'Shows the username of the users.' do
      visit "/users/#{@user.id}"
      expect(page).to have_css('.user-name')
    end

    it 'Shows the profile picture of the users.' do
      visit "/users/#{@user.id}"
      expect(page).to have_css('.photo-container')
    end

    it 'Shows the number of posts of the users.' do
      visit "/users/#{@user.id}"
      expect(page).to have_css('.posts_counter')
    end

    it 'Redirects me to the user profile page when I click its name' do
      visit "/users/#{@user.id}"
      click_on 'joao'
      expect(page).to have_css('.bio-container')
    end

    it 'Shows user first 3 posts' do
      visit "/users/#{@user.id}"
      expect(page).to have_css('.post-container', count: 3)
    end

    it 'Shows a button that leads to all posts from that user' do
      visit "/users/#{@user.id}"
      expect(page).to have_link('See all posts')
    end

    it 'Leads me to the post page when I click its title' do
      visit "/users/#{@user.id}"
      click_on 'post 0'
      expect(page).to have_css('.post-header')
    end

    it 'Leads me to the full post list for that user' do
      visit "/users/#{@user.id}"
      click_on 'See all posts'
      expect(page).to have_css('.user-name')
      expect(page).to have_css('.post-container')
    end
  end
end
