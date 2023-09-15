require 'swagger_helper'

RSpec.describe 'softskills', type: :request do
  path '/softskills' do
    get('list softskills') do
      tags ['Softskill']
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

  path '/softskills/{id}' do
    parameter name: 'id', in: :path

    get('show tech') do
      tags ['Softskill']
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

  path '/softskills/{id}' do
    parameter name: 'id', in: :path

    get('show tech by id') do
      tags ['Softskill']
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
