Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/destroy'
  get 'reviews/edit'
  get 'reviews/show'
  get 'reviews/update'
  resources :records
  post "/estimateamounts/:user_id", to: "estimate_amounts#create", as: "set_estimate_amount"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  resources :users, only: [:show]
  root to: "home#index"
end
