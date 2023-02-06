Rails.application.routes.draw do
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'sessions#new'
  resources :registrations
  resources :sessions

  # root :to => 'users#index'
  resources :users

  resources :homes, only: [:index]

  get 'logout' => 'sessions#destroy', :as => 'logout'
end
