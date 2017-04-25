Rails.application.routes.draw do
  get 'users/new'
  get 'static_pages/home'
  root 'static_pages#home'
  
  resources :users do
    resources :courses
  end
end
