require 'swagger_helper'

RSpec.describe 'Posts', type: :request do
  let(:Authorization) { "Bearer eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MSwiZXhwIjoxNjQyNTI0NTAzfQ.HPD_554JtyCQgLxYGHTk_Gv9TbkN0cBID3rDivFX9os" }
  path '/posts' do

    get 'Get the posts' do
      tags 'Post'
      produces 'application/json'
      security [Bearer: {}]
      parameter name: :Authorization, in: :header, type: :string, description: 'Authorization token'

      response '200', 'See al posts' do
        schema type: :object,
        properties: {
          id: { type: :integer },
          author_id: { type: :integer },
          title: { type: :string },
          text: { type: :string },
          comments_counter: { type: :integer },
          likes_counter: { type: :integer },
          created_at: { type: :string },
          updated_at: { type: :string }
        },
        run_test!
      end

      response '422', 'invalid request' do
        let(:posts) { { title: 'foo' } }
        run_test!
      end
    end
  end

end
