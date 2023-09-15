require 'swagger_helper'

RSpec.describe 'Profiles', type: :request do
  path '/health' do
    get 'Health check' do
      tags 'health'
      produces 'application/json'

      response '200', 'Health check' do
        example 'application/json', :example, {
          "status": 'UP'
        }
        schema type: :object,
               properties: {
                 status: {
                   type: :string,
                   example: 'UP'
                 }
               }

        run_test!
      end
    end
  end
end
