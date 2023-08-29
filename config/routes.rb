Rails.application.routes.draw do
  resources :categories
  resources :bookings
  resources :events, only [:show, :index]
  resources :users, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
