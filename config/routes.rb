Rails.application.routes.draw do
  get  'login',  to: 'sessions#new'
  get  'logout', to: 'sessions#destroy'
  post 'login',  to: 'sessions#create'
  
  get  'singup', to: 'users#new'
  post 'singup', to: 'users#create'

  root 'timeline#index'
end
