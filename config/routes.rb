Rails.application.routes.draw do
  mount Notifications::Engine => "/notifications"
  devise_for :users
  root "posts#index"
  resources :peoples
  resources :posts do
    resources :comments,only: [:create,:destroy]
  end
end
