# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

  root 'sessions#new'
  resources :registrations
  resources :sessions
  resources :users do
    member do
      put 'toggle_active', to: 'users#toggle_active'
    end
  end
  resources :students

  resources :homes, only: [:index]
  get 'logout' => 'sessions#destroy', :as => 'logout'
end
