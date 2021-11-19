require 'swagger_helper'

RSpec.describe 'Posts', type: :request do
  before(:all) do
    @user = User.new(
      name: 'Alejandro',
      photo: 'somephoto',
      bio: 'somebio',
      email: 'test5@hotmail.com',
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
    @user.posts.first.comments.create(text: 'This is a comment for testing')
  end

  path '/posts/{id}/comments' do
    get 'Get the comments' do
      tags 'Comments'
      produces 'application/json'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      security [bearerAuth: {}]

      response '200', 'See all comments' do
        let(:Authorization) { "Bearer #{@token}" }
        let(:id) { @user.posts.first.id.to_s }
        run_test!
      end

      response '401', 'No authorization code.' do
        let(:Authorization) { '' }
        let(:id) { @user.posts.first.id.to_s }
        run_test!
      end

      response '404', 'No post found with this :id' do
        let(:Authorization) { "Bearer #{@token}" }
        let(:id) { '19238913' }
        run_test!
      end
    end
  end

  path '/posts/{id}/comments/create_json' do
    post 'Create a comment' do
      tags 'create comment'
      consumes 'application/json'
      security [bearerAuth: {}]
      parameter name: :id, in: :path, type: :string
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string }
        },
        required: ['text']
      }

      response '200', 'Create the comment' do
        let(:Authorization) { "Bearer #{@token}" }
        let(:id) { @user.posts.first.id.to_s }
        let(:comment) { { text: 'hello api' } }
        run_test!
      end

      response '401', 'No authorization code.' do
        let(:Authorization) { '' }
        let(:id) { @user.posts.first.id.to_s }
        let(:comment) { { text: 'hello api' } }
        run_test!
      end

      response '404', 'No post found with this :id' do
        let(:Authorization) { "Bearer #{@token}" }
        let(:id) { '19238913' }
        let(:comment) { { text: 'hello api' } }
        run_test!
      end
    end
  end
end
