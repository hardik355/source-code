Rails.application.routes.draw do
  root 'home#index'  


  # users routes
  get 'users/new', to: 'users#new'
  post 'users', to: 'users#create'

  get 'user/:slug/edit', to: 'users#edit', as: 'edit_user'
  patch 'user/:slug', to: 'users#update', as: :user
  put 'user/:slug', to: 'users#update'

  # Custom Home Controller Routes
  get 'user/home', to: 'users#user_home'
  get 'user/build_address', to: 'users#build_address'

  

  # resources :users
  get 'sign_in', to: 'sessions#new', as: 'sign_in'
  post 'login', to: 'sessions#create', as: 'user_login'
end
