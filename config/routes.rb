Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:create] 
      resources :likes, only: [:create]
    end
  end
  resources :posts, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
