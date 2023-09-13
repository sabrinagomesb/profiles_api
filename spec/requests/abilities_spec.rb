# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'abilities', type: :request do
  path '/abilities' do
    get('list abilities') do
      tags ['Abilities']

      parameter name: :role, in: :query, type: :string,
                description: 'Role filter (e.g., frontend, backend, fullstack, mobile, designer, qa)'

      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
