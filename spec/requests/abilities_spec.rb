# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'abilities', type: :request do
  path '/abilities' do
    get('list abilities') do
      tags ['Abilities']

      parameter name: :role, in: :query, type: :string, enum: %w[frontend backend fullstack mobile designer qa],
                description: 'Role filter (e.g., frontend, backend, fullstack, mobile, designer, qa)',
                required: true, example: 'frontend'

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

  path '/abilities/{id}' do
    parameter name: 'id', in: :path

    get('show ability by id') do
      tags ['Abilities']
      response(200, 'successful') do
        let(:id) { '1' }

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
