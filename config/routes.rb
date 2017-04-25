Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get 'users/new'
  get 'static_pages/home'
  resources :users
end
