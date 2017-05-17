Rails.application.routes.draw do
  
  root 'static_pages#home'

  get 'categories/show'

  get 'categories/new'

  get 'categories/create'
  
  get 'locations/new'
  
  get 'static_pages/home'
  
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get 'users/new'
  
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  post 'messages/create', to: 'messages#create', as: 'create_message'
  
  post '/likes' => 'likeables#like', as: :like_create
  post '/dislikes' => 'likeables#dislike', as: :dislike_create

  resources :users
  resources :courses
  resources :locations
  resources :categories
  resources :likeables

end
