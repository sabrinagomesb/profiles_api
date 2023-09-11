Rails.application.routes.draw do
  resources :profiles, only: [:create, :show, :index]

  resources :teches, only: [:index, :show]
end
