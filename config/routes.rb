Rails.application.routes.draw do
  resources :reviews, except: [:new, :create] do 
    resources :comments, only: [:create,:destroy]
  end
  get "reviews/new/:product_id", to: "reviews#new", as: "new_review"
  post "reviews/:product_id", to: "reviews#create", as: "create_review"
  resources :records
  post "/estimateamounts/:user_id", to: "estimate_amounts#create", as: "set_estimate_amount"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  resources :users, only: [:show, :edit,:update,:destroy]
  root to: "home#index"
end
