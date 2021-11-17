RSpec.describe 'User', type: :system do
  before(:all) do
    user = User.new(
      name:'Vitor', 
      photo:'somephoto', 
      bio:'somebio',
      email:'something3@hotmail.com',
      password:'123456',
    )
    user.skip_confirmation!
    user.save!
  end

  describe 'index page' do
    it 'Shows inputs for email and password' do
      visit '/users/sign_in'
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
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
      fill_in 'Email', with: 'something3@hotmail.com'
      fill_in 'Password', with: '123456'
      click_on 'Log in'
      expect(page).to have_selector('h1', text: 'All Users')
    end
  end
end