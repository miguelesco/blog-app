require 'rails_helper'

RSpec.describe 'Users', type: :request do

  describe 'GET #index' do
    before(:example) { get '/' } # get(:index)
    it 'is a success' do
      expect(response).to have_http_status(200)
    end

    it 'renders the content of the page' do
      expect(response).to render_template(partial: 'shared/_userbar')
    end
  end

  describe 'Get #show' do
    before(:example) { get '/users/1' } # get(:show, params: { id: 1 })
    it 'is a success' do
      expect(response).to have_http_status(200)
    end

    it 'renders the userbar of the page' do
      expect(response.body).to render_template(partial: 'shared/_userbar')
    end

    it "renders 'shared/postbar template" do
      expect(response).to render_template(partial: 'shared/_postbar')
    end
  end
end
