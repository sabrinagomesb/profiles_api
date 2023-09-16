require 'swagger_helper'

RSpec.describe 'Profiles', type: :request do
  path '/profiles' do
    get('list profiles') do
      tags ['Profiles']
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
      tags ['Profiles']
      request_body_example value: {
                             "profile": {
                               "name": 'Sabrina',
                               "email": 'sabrina@example.com',
                               "birthdate": '1991-07-27',
                               "phone": '85988556677',
                               "role": 'frontend',
                               "bio": 'Uma desenvolvedora iniciante que está se dedicando para ser fullstack. Atualmente trabalhando com Ruby on Rails.',
                               "links": ['https://github.com/sabrinagomesb', 'https://www.linkedin.com/in/sabrina-gomes-bezerra/'],
                               "city_id": '678',
                               "experiences_attributes": [
                                 {
                                   "title": 'Desenvolvedor Backend',
                                   "company_name": 'RaroLabs',
                                   "start_date": '2023-09-04',
                                   "function_performed": 'Desenvolver sistemas web com Ruby on Rails'
                                 },
                                 {
                                   "title": 'Estagiário de Desenvolvimento Web',
                                   "company_name": 'WebTech',
                                   "start_date": '2020-01-15',
                                   "end_date": '2020-12-31',
                                   "function_performed": 'Desenvolver com React'
                                 }
                               ],
                               "studies_attributes": [
                                 {
                                   "title": 'Bacharelado em Ciência da Computação',
                                   "institution": 'Raro Academy',
                                   "link": 'www.raroacademy.com.br',
                                   "start_date": '2022-08-01'
                                 },
                                 {
                                   "title": 'Curso de Desenvolvimento Web Avançado',
                                   "institution": 'Raro Academy',
                                   "link": 'www.raroacademy.com.br',
                                   "start_date": '2023-03-05',
                                   "end_date": '2023-06-12'
                                 }
                               ],
                               "ability_ids": [1, 3],
                               "softskill_ids": [1, 2, 3],
                               "tech_ids": [3]
                             }
                           },
                           name: 'Example', summary: 'Create a profile'

      response(201, 'profile created') do
        example 'application/json', :created, {
          "id": 18,
          "name": 'Sabrina',
          "email": 'sabrina@example.com',
          "birthdate": '1991-07-27',
          "phone": '85988556677',
          "links": [
            'https://github.com/sabrinagomesb',
            'https://www.linkedin.com/in/sabrina-gomes-bezerra/'
          ],
          "role": 'frontend',
          "created_at": '2023-09-16T14:10:25.350Z',
          "updated_at": '2023-09-16T14:10:25.350Z',
          "bio": 'Uma desenvolvedora iniciante que está se dedicando para ser fullstack. Atualmente trabalhando com Ruby on Rails.',
          "city_id": 678,
          "experiences": [
            {
              "id": 25,
              "title": 'Desenvolvedor Backend',
              "company_name": 'RaroLabs',
              "start_date": '2023-09-04',
              "function_performed": 'Desenvolver sistemas web com Ruby on Rails',
              "profile_id": 18,
              "created_at": '2023-09-16T14:10:25.352Z',
              "updated_at": '2023-09-16T14:10:25.352Z'
            },
            {
              "id": 26,
              "title": 'Estagiário de Desenvolvimento Web',
              "company_name": 'WebTech',
              "start_date": '2020-01-15',
              "end_date": '2020-12-31',
              "function_performed": 'Desenvolver com React',
              "profile_id": 18,
              "created_at": '2023-09-16T14:10:25.361Z',
              "updated_at": '2023-09-16T14:10:25.361Z'
            }
          ],
          "studies": [
            {
              "id": 25,
              "title": 'Bacharelado em Ciência da Computação',
              "start_date": '2022-08-01',
              "profile_id": 18,
              "created_at": '2023-09-16T14:10:25.363Z',
              "updated_at": '2023-09-16T14:10:25.363Z',
              "link": 'www.raroacademy.com.br',
              "institution": 'Raro Academy'
            },
            {
              "id": 26,
              "title": 'Curso de Desenvolvimento Web Avançado',
              "start_date": '2023-03-05',
              "end_date": '2023-04-06',
              "profile_id": 18,
              "created_at": '2023-09-16T14:10:25.365Z',
              "updated_at": '2023-09-16T14:10:25.365Z',
              "link": 'www.raroacademy.com.br',
              "institution": 'Raro Academy'
            }
          ],
          "abilities": [
            {
              "id": 1,
              "name": 'Design de Interface de Usuário (UI)',
              "role": 'frontend',
              "created_at": '2023-09-15T06:22:14.903Z',
              "updated_at": '2023-09-15T06:22:14.903Z',
              "description": 'Habilidade em criar interfaces de usuário atraentes e funcionais.'
            },
            {
              "id": 3,
              "name": 'Design de Experiência do Usuário (UX)',
              "role": 'frontend',
              "created_at": '2023-09-15T06:22:14.913Z',
              "updated_at": '2023-09-15T06:22:14.913Z',
              "description": 'Conhecimento em criar experiências de usuário intuitivas e eficientes.'
            }
          ],
          "softskills": [
            {
              "id": 1,
              "name": 'Comunicação',
              "created_at": '2023-09-15T06:22:15.462Z',
              "updated_at": '2023-09-15T06:22:15.462Z'
            },
            {
              "id": 2,
              "name": 'Trabalho em Equipe',
              "created_at": '2023-09-15T06:22:15.468Z',
              "updated_at": '2023-09-15T06:22:15.468Z'
            },
            {
              "id": 3,
              "name": 'Adaptabilidade',
              "created_at": '2023-09-15T06:22:15.475Z',
              "updated_at": '2023-09-15T06:22:15.475Z'
            }
          ],
          "techs": [
            {
              "id": 3,
              "name": 'Node.js',
              "created_at": '2023-09-15T06:22:14.541Z',
              "updated_at": '2023-09-15T06:22:14.541Z'
            }
          ]
        }
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
                          bio: { type: :string },
                          phone: { type: :string },
                          links: {
                            type: :array,
                            items: {
                              type: :string
                            }
                          },
                          role: { type: :string },
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
                              required: %w[title company_name start_date function_performed]
                            }
                          },
                          studies_attributes: {
                            type: :array,
                            items: {
                              type: :object,
                              properties: {
                                title: { type: :string },
                                institution: { type: :string },
                                start_date: { type: :string, format: :date },
                                end_date: { type: :string, format: :date },
                                link: { type: :string }
                              },
                              required: %w[title institution]
                            }
                          },
                          ability_ids: {
                            type: :array,
                            items: {
                              type: :integer
                            }
                          },
                          softskill_ids: {
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
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    get('show profile') do
      tags ['Profiles']
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

  path '/profiles/{id}/download' do
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    get('download profile') do
      tags ['Profiles']
      response(200, 'successful') do
        let(:id) { '123' }
        # inform that returns a PDF file
        produces 'application/pdf'

        after do |example|
          example.metadata[:response][:content] = {
            'application/pdf' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
