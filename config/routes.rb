Rails.application.routes.draw do
  root 'users#index'
  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { sessions: :sessions },
                      path_names: { sign_in: :login }
  end
  get '/posts', to: 'posts#json'
  get '/posts/:id/comments', to: 'comments#json'
  post '/posts/:id/comments/create_json', to: 'comments#json_create'
  resources :users, only: [:index, :show, :generate_jwt] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:create, :destroy] 
      resources :likes, only: [:create]
    end
  end
  resources :posts, only: [:new, :create]

  delete 'posts/:id/delete', to: 'posts#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
