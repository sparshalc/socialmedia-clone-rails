Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :peoples
  resources :posts
end
