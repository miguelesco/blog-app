Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  get '/posts', to: 'posts#json'
  get '/posts/:id/comments', to: 'comments#json'
  post '/posts/:id/comments/create', to: 'comments#json_create'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:create] 
      resources :likes, only: [:create]
    end
  end
  resources :posts, only: [:new, :create]

  delete 'posts/:id/delete', to: 'posts#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
