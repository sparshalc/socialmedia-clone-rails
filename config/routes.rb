Rails.application.routes.draw do
  mount Notifications::Engine => "/notifications"
  devise_for :users
  root "posts#index"
  resources :peoples
  get 'about/page'
  resources :likes, only: [:create, :destroy]
  resources :posts do
    resources :comments
  end
end
