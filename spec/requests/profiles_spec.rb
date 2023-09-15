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
                               "role": 'fullstack',
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
          "id": 12,
          "name": 'Sabrina',
          "email": 'sabrina@example.com',
          "birthdate": '1991-07-27',
          "phone": '85988556677',
          "links": [],
          "role": 'fullstack',
          "created_at": '2023-09-15T05:00:49.347Z',
          "updated_at": '2023-09-15T05:00:49.347Z',
          "bio": 'Uma desenvolvedora fullstack que atualmente está se dedicando a Ruby on Rails, feliz com a ideia de ser fullstack',
          "city_id": 678,
          "experiences": [
            {
              "id": 13,
              "title": 'Desenvolvedor Web Fullstack',
              "company_name": 'TechCo',
              "start_date": '2021-03-01',
              "end_date": 'null',
              "function_performed": 'Desenvolver Rails atuando na concepção de projetos',
              "profile_id": 12,
              "created_at": '2023-09-15T05:00:49.349Z',
              "updated_at": '2023-09-15T05:00:49.349Z'
            },
            {
              "id": 14,
              "title": 'Estagiário de Desenvolvimento Web',
              "company_name": 'WebTech',
              "start_date": '2020-01-15',
              "end_date": '2020-12-31',
              "function_performed": 'Desenvolver com React',
              "profile_id": 12,
              "created_at": '2023-09-15T05:00:49.351Z',
              "updated_at": '2023-09-15T05:00:49.351Z'
            }
          ],
          "studies": [
            {
              "id": 'null',
              "title": 'Bacharelado em Ciência da Computação',
              "start_date": '2018-09-01',
              "end_date": '2022-06-30',
              "profile_id": 12,
              "created_at": 'null',
              "updated_at": 'null',
              "link": 'null',
              "institution": 'null'
            },
            {
              "id": 'null',
              "title": 'Curso de Desenvolvimento Web Avançado',
              "start_date": 'null',
              "end_date": 'null',
              "profile_id": 12,
              "created_at": 'null',
              "updated_at": 'null',
              "link": 'null',
              "institution": 'null'
            }
          ],
          "abilities": [
            {
              "id": 1,
              "name": 'Design de Interface de Usuário (UI)',
              "role": 'frontend',
              "created_at": '2023-09-15T04:46:58.944Z',
              "updated_at": '2023-09-15T04:46:58.944Z',
              "description": 'Habilidade em criar interfaces de usuário atraentes e funcionais.'
            },
            {
              "id": 3,
              "name": 'Design de Experiência do Usuário (UX)',
              "role": 'frontend',
              "created_at": '2023-09-15T04:46:58.954Z',
              "updated_at": '2023-09-15T04:46:58.954Z',
              "description": 'Conhecimento em criar experiências de usuário intuitivas e eficientes.'
            }
          ],
          "softskills": [
            {
              "id": 1,
              "name": 'Comunicação',
              "created_at": '2023-09-15T04:46:59.465Z',
              "updated_at": '2023-09-15T04:46:59.465Z'
            },
            {
              "id": 2,
              "name": 'Trabalho em Equipe',
              "created_at": '2023-09-15T04:46:59.472Z',
              "updated_at": '2023-09-15T04:46:59.472Z'
            },
            {
              "id": 3,
              "name": 'Adaptabilidade',
              "created_at": '2023-09-15T04:46:59.477Z',
              "updated_at": '2023-09-15T04:46:59.477Z'
            }
          ],
          "techs": [
            {
              "id": 3,
              "name": 'Node.js',
              "created_at": '2023-09-15T04:46:58.573Z',
              "updated_at": '2023-09-15T04:46:58.573Z'
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
    parameter name: 'id', in: :path, type: :string, description: 'id'

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
end
