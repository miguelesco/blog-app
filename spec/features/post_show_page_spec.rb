require 'rails_helper'
require 'database_cleaner/active_record'

RSpec.describe 'Post', type: :feature do
  before(:all) do
    @user = User.new(
      name: 'Pedrinho',
      photo: 'somephoto',
      bio: 'somebio',
      email: 'something5@hotmail.com',
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

  describe 'Show page' do
    it 'Shows the title of the posts.' do
      visit "/users/#{@user.id}/posts/#{@user.posts.first.id}"
      expect(page).to have_css('.title-author')
    end

    it 'Shows the author of the post.' do
      visit "/users/#{@user.id}/posts/#{@user.posts.first.id}"
      expect(page).to have_css('.title-author')
    end

    it 'Shows the body of the posts.' do
      visit "/users/#{@user.id}/posts/#{@user.posts.first.id}"
      expect(page).to have_css('.text')
    end

    it 'Shows the comments counter for the posts.' do
      visit "/users/#{@user.id}/posts/#{@user.posts.first.id}"
      expect(page).to have_css('.comments-counter')
    end

    it 'Shows the likes counter for the posts.' do
      visit "/users/#{@user.id}/posts/#{@user.posts.first.id}"
      expect(page).to have_css('.likes-counter')
    end

    it 'Shows all comments for the posts.' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'something5@hotmail.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'
      visit "/users/#{@user.id}/posts/#{@user.posts.first.id}"
      fill_in 'Add a comment:', with: 'This is a comment'
      click_on 'Create Comment'
      expect(page).to have_selector('p', text: 'This is a comment')
    end

    it 'Shows all users for the comments.' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'something5@hotmail.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'
      visit "/users/#{@user.id}/posts/#{@user.posts.first.id}"
      fill_in 'Add a comment:', with: 'This is a comment'
      click_on 'Create Comment'
      expect(page).to have_selector('p', text: 'Pedrinho')
    end
  end
end
