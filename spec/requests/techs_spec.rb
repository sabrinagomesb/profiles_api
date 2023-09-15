require 'swagger_helper'

RSpec.describe 'techs', type: :request do
  path '/techs' do
    get('list techs') do
      tags ['Techs']
      response(200, 'successful') do
        example 'application/json', :example, [
          {
            "id": 1,
            "name": 'Ruby on Rails',
            "created_at": '2023-09-15T04:46:58.560Z',
            "updated_at": '2023-09-15T04:46:58.560Z'
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

  path '/techs/{id}' do
    parameter name: 'id', in: :path

    get('show tech') do
      tags ['Techs']
      response(200, 'successful') do
        example 'application/json', :example, {
          "id": 1,
          "name": 'Ruby on Rails',
          "created_at": '2023-09-15T04:46:58.560Z',
          "updated_at": '2023-09-15T04:46:58.560Z'
        }

        let(:id) { '123' }

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

  path '/techs/{id}' do
    parameter name: 'id', in: :path

    get('show tech by id') do
      tags ['Techs']
      response(200, 'successful') do
        let(:id) { '123' }

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
