Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :rooms
  resources :seats
  resources :groups
  resources :users
  root "rooms#index"
end
