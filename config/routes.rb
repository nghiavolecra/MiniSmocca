Rails.application.routes.draw do
  get "contact_requests/new"
  get "contact_requests/create"
  get "home/index"
  get 'regions/:region_id', to: 'regions#show', as: :region
  root "properties#index"
  resources :properties, only: [:index, :show]
  resources :contact_requests, only: [:new, :create]
end
