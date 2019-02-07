Rails.application.routes.draw do

  resources :sessions
  get '/', to: 'sessions#index', as: 'index'
  resources :comments
  resources :gossips
  resources :users
  resources :citys
  resources :sessions, only: [:new, :create, :destroy]
end
