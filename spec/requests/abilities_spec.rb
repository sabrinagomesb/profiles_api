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
        example 'application/json', :example, [
          {
            "id": 2,
            "name": "Design de Interface de Usuário (UI)",
            "role": "fullstack",
            "created_at": "2023-09-15T04:46:58.949Z",
            "updated_at": "2023-09-15T04:46:58.949Z",
            "description": "Habilidade em criar interfaces de usuário atraentes e funcionais."
          }
        ]
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
        example 'application/json', :example, {
          "id": 2,
          "name": "Design de Interface de Usuário (UI)",
          "role": "fullstack",
          "created_at": "2023-09-15T04:46:58.949Z",
          "updated_at": "2023-09-15T04:46:58.949Z",
          "description": "Habilidade em criar interfaces de usuário atraentes e funcionais."
        }
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
