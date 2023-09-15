# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  # health check
  get '/health', to: 'health#health'

  resources :profiles, only: %i[create show index]
  resources :teches, only: %i[index show], path: 'techs'
  resources :abilities, only: %i[show index]
  resources :softskills, only: %i[show index]
  resources :states, only: %i[index show] do
    resources :cities, only: %i[index show]
  end
end
