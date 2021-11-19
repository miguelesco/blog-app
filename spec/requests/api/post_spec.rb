require 'swagger_helper'

RSpec.describe 'Posts', type: :request do
  before(:all) do
    @user = User.new(  
      name: 'Alejandro',
      photo: 'somephoto',
      bio: 'somebio',
      email: 'test4@hotmail.com',
      password: '123456'
    )
    @user.skip_confirmation!
    @user.save!
    @token = @user.generate_jwt
    x = 0
    while x < 3
      @user.posts.create(
        title: "post #{x}",
        text: "this is post's #{x} text"
      )
      x += 1
    end
  end

  path '/posts' do

    get 'Get the posts' do
      tags 'Post'
      produces 'application/json'
      security [ bearerAuth: {} ]

      response '200', 'See all posts' do
        let(:Authorization) { "Bearer #{@token}" }
        run_test!
      end

      response '404', 'No authorization code.' do
        let(:Authorization) { "" }
        run_test!
      end
    end
  end
end
