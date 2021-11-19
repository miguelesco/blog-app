require 'swagger_helper'

RSpec.describe 'api/user', type: :request do

  before(:all) do
    user = User.new(  
      name: 'Alejandro',
      photo: 'somephoto',
      bio: 'somebio',
      email: 'test3@hotmail.com',
      password: '123456'
    )
    user.skip_confirmation!
    user.save!
    x = 0
    while x < 3
      user.posts.create(
        title: "post #{x}",
        text: "this is post's #{x} text"
      )
      x += 1
    end
  end

  path '/api/users/login' do

    post 'login user' do
      tags 'Login'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            email: { type: :string },
            password: { type: :string }
          }
        },
        required: [ 'email', 'password' ]
      }

      response '200', 'User logged' do
        let(:user) { { user: {email: 'test3@hotmail.com', password: '123456'} } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { user: {email: 'testsas@hotmail.com', password: '12345678'} } }
        run_test!
      end
    end
  end


end
