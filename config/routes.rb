# frozen_string_literal: true

Rails.application.routes.draw do
  resources :profiles, only: %i[create show index]

  resources :teches, only: %i[index show], path: 'techs'

  get '/abilities', to: 'abilities#index'
end
