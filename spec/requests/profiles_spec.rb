require 'swagger_helper'

RSpec.describe 'profiles', type: :request do
  path '/profiles' do
    get('list profiles') do
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

    post('create profile') do
      response(201, 'profile created') do
        consumes 'application/json'
        parameter name: :profile, in: :body, schema: {
                    type: :object,
                    properties: {
                      profile: {
                        type: :object,
                        properties: {
                          name: { type: :string },
                          email: { type: :string },
                          birthdate: { type: :string, format: :date },
                          phone: { type: :string },
                          links: {
                            type: :array,
                            items: {
                              type: :string
                            }
                          },
                          role: { type: :string },
                          bio: { type: :string },
                          experiences_attributes: {
                            type: :array,
                            items: {
                              type: :object,
                              properties: {
                                title: { type: :string },
                                company_name: { type: :string },
                                start_date: { type: :string, format: :date },
                                end_date: { type: :string, format: :date },
                                function_performed: { type: :string }
                              },
                              required: %w[title company_name start_date end_date function_performed]
                            }
                          },
                          studies_attributes: {
                            type: :array,
                            items: {
                              type: :object,
                              properties: {
                                title: { type: :string },
                                start_date: { type: :string, format: :date },
                                end_date: { type: :string, format: :date }
                              },
                              required: %w[title start_date end_date]
                            }
                          },
                          ability_ids: {
                            type: :array,
                            items: {
                              type: :integer
                            }
                          },
                          tech_ids: {
                            type: :array,
                            items: {
                              type: :integer
                            }
                          }
                        },
                        required: %w[name email birthdate phone role]
                      }
                    },
                    required: ['profile']
                  }

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

  path '/profiles/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show profile') do
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
