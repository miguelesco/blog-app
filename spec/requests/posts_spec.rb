require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before { get '/users/:user_id/posts' }
    it 'returns http success' do
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end

    it 'display the text in the page' do
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET /show' do
    before { get '/users/:user_id/posts/:id' }
    it 'returns http success' do
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      expect(response).to render_template('show')
    end

    it 'display the text in the page' do
      expect(response.body).to include('here you can watch and read the post')
    end
  end
end
