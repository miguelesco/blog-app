require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before { get '/users/1/posts' }
    it 'returns http success' do
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end

    it 'render the partial shared/userbar in the page' do
      expect(response).to render_template(partial: 'shared/_userbar')
    end
  end

  describe 'GET /show' do
    before { get '/users/1/posts/3' }
    it 'returns http success' do
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      expect(response).to render_template('show')
    end

    it 'render the page show' do
      expect(response).to render_template('show')
    end
  end
end
