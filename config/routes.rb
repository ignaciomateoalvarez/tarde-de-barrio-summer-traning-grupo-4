# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

  root 'users#index'
  resources :registrations
  resources :sessions
  resources :users, except: [:show] do
    member do
      put 'toggle_active', to: 'users#toggle_active'
    end
  end
  resources :students do
    resources :likes, only: [:destroy]
    resources :comments, only: [:create] do
      resources :sub_comments, only: [:create]
      resources :likes, only: [:create]
    end
  end

  resources :homes, only: [:index]
  get 'logout' => 'sessions#destroy', :as => 'logout'
end
