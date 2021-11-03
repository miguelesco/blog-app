require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before { get '/users' } # get(:index)
    it 'is a success' do
      expect(response).to have_http_status(200)
    end

    it 'renders the content of the page' do
      expect(response.body).to include('Here is the list of all the users and posts')
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
  end

  describe 'Get #show' do
    before { get '/users/1' } # get(:show, params: { id: 1 })
    it 'is a success' do
      expect(response).to have_http_status(200)
    end

    it 'renders the content of the page' do
      expect(response.body).to include('Here you can see all the info of the user')
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
  end
end
