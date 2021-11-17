Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:create, :destroy] 
      resources :likes, only: [:create]
    end
  end
  resources :posts, only: [:new, :create]
  delete 'posts/:id/delete', to: 'posts#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
