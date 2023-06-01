Rails.application.routes.draw do
  get 'singup', to: 'users#new'
  post 'singup', to: 'users#create'
  root 'timeline#index'
end
