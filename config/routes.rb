Rails.application.routes.draw do

  get 'categories/show'

  get 'categories/new'

  get 'categories/create'
  
  get 'locations/new'

  root 'static_pages#home'
  get 'static_pages/home'
  
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get 'users/new'
  
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :courses
  resources :locations
  resources :categories

end
