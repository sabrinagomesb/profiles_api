# PROFILES API

A PROFILES API é uma aplicação API-only desenvolvida em Ruby on Rails para fins de prática e estudo. Ela utiliza o banco de dados PostgreSQL e é baseada nas versões Rails 7 e Ruby 3.2.2.

## Documentação

A documentação da API está disponível em [Swagger UI](https://profile-api-vyah.onrender.com/api-docs) para consulta completa dos endpoints, exemplos de solicitações e respostas.

## Instalação

Não é necessário instalar a API localmente, pois ela está disponível em um ambiente online. Para começar a explorar os endpoints e a documentação, basta acessar [Swagger UI](https://profile-api-vyah.onrender.com/api-docs). O serviço utilizado para hospedar a API é o [Render](https://render.com/).

## Endpoints

A API oferece os seguintes endpoints:

- `GET /health`: Verifica o status de saúde da API.
- `POST /profiles`: Cria um novo perfil.
- `GET /profiles`: Retorna uma lista de perfis.
- `GET /profiles/{id}`: Retorna detalhes de um perfil específico.
- `GET /profiles/{id}/download`: Permite o download de um perfil em formato PDF.
- `GET /techs`: Retorna uma lista de tecnologias.
- `GET /techs/{id}`: Retorna detalhes de uma tecnologia específica.
- `GET /abilities`: Retorna uma lista de habilidades.
- `GET /abilities/{id}`: Retorna detalhes de uma habilidade específica.
- `GET /states`: Retorna uma lista de Estados.
- `GET /states/{id}`: Retorna detalhes de um Estado específico.
- `GET /states/{id}/cities`: Retorna uma lista de cidades pertencentes a um Estado específico.

## Deploy

A API está hospedada em [PROFILES API](https://profile-api-vyah.onrender.com/).
