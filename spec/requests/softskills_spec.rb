require 'swagger_helper'

RSpec.describe 'softskills', type: :request do
  path '/softskills' do
    get('list softskills') do
      tags ['Softskill']
      response(200, 'successful') do
        example 'application/json', :example, [
          {
            "id": 1,
            "name": 'Comunicação',
            "created_at": '2023-09-15T04:46:59.465Z',
            "updated_at": '2023-09-15T04:46:59.465Z'
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

  path '/softskills/{id}' do
    parameter name: 'id', in: :path

    get('show softskill') do
      tags ['Softskill']
      response(200, 'successful') do
        example 'application/json', :example, {
          "id": 1,
          "name": 'Comunicação',
          "created_at": '2023-09-15T04:46:59.465Z',
          "updated_at": '2023-09-15T04:46:59.465Z'
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
end
