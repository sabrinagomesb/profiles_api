require 'swagger_helper'

RSpec.describe 'states', type: :request do
  path '/states' do
    get('list states') do
      tags ['State/City']
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

  path '/states/{id}' do
    parameter name: 'id', in: :path

    get('show state') do
      tags ['State/City']
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

  path '/states/{id}' do
    parameter name: 'id', in: :path

    get('show state by id') do
      tags ['State/City']
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

  path '/states/{state_id}/cities' do
    parameter name: 'state_id', in: :path

    get('list cities from state') do
      tags ['State/City']
      response(200, 'successful') do
        let(:state_id) { '123' }

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

  path '/states/{state_id}/cities/{id}' do
    parameter name: 'state_id', in: :path
    parameter name: 'id', in: :path

    get('show city from state') do
      tags ['State/City']
      response(200, 'successful') do
        let(:state_id) { '123' }
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
