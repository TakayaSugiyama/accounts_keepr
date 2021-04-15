# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  concern :csv do
    post "csv", on: :collection
  end
  resources :reviews, except: %i[new create] do
    resources :comments, only: %i[create destroy]
    resources :favorites, only: %i[create destroy]
  end
  get 'reviews/new/:product_id', to: 'reviews#new', as: 'new_review'
  post 'reviews/:product_id', to: 'reviews#create', as: 'create_review'
  resources :records, concerns: :csv
  post '/estimateamounts/:user_id', to: 'estimate_amounts#create', as: 'set_estimate_amount'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  resources :users, only: %i[show edit update destroy]
  get '/services', to: 'home#service'
  get '/privacys', to: 'home#privacy'
end
