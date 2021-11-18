require 'rails_helper'
require 'database_cleaner/active_record'

RSpec.describe 'Post', type: :system do
  before(:all) do
    @user = User.new(
      name: 'Peter',
      photo: 'somephoto',
      bio: 'somebio',
      email: 'something4@hotmail.com',
      password: '123456'
    )
    @user.skip_confirmation!
    @user.save!
    x = 0
    while x < 3
      @user.posts.create(
        title: "post #{x}",
        text: "this is post's #{x} text"
      )
      x += 1
    end
  end

  describe 'Index page' do
    it 'Shows the username of the users.' do
      visit "/users/#{@user.id}/posts"
      expect(page).to have_css('.user-name')
    end

    it 'Shows the profile picture of the users.' do
      visit "/users/#{@user.id}/posts"
      expect(page).to have_css('.photo-container')
    end

    it 'Shows the number of posts of the users.' do
      visit "/users/#{@user.id}/posts"
      expect(page).to have_css('.posts_counter')
    end

    it 'Shows the title of the posts.' do
      visit "/users/#{@user.id}/posts"
      expect(page).to have_css('.title')
    end

    it 'Shows the body of the posts.' do
      visit "/users/#{@user.id}/posts"
      expect(page).to have_css('.text')
    end

    it 'Shows the comments of the posts.' do
      visit "/users/#{@user.id}/posts"
      expect(page).to have_css('.comments')
    end

    it 'Shows the likes counter for the posts.' do
      visit "/users/#{@user.id}/posts"
      expect(page).to have_css('.likes')
    end

    it 'Redirects me to the post page when I click its title' do
      visit "/users/#{@user.id}/posts"
      click_on 'post 0'
      expect(page).to have_css('.post-header')
    end
  end
end
